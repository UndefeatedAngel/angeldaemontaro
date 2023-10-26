//
//  VideoScreenViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.04.23.
//

import UIKit
import FirebaseStorage

class VideoScreenTableViewController: UIViewController {
    var arrayVideo: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureTabBar()
        
        updateTheme()
        
        loadFromServer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logScreen(screenName: "Video", screenClass: String(describing: self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = getLocale(key: "videoMenu")
    }
    
    func loadFromServer() {
        getFirebaseJson(jsonName: "configVideo.json") { [weak self] dataJson in
            guard let self = self else { return }
            do {
                let content = try JSONDecoder().decode([VideoModel.VideoModelJson].self, from: dataJson)
                self.setupVideo(content: content)
            } catch {
                self.setupVideoError()
            }
        } error: {
            self.setupVideoError()
        }
    }
    
    func setupVideo(content: [VideoModel.VideoModelJson]) {
        for item in content {
            arrayVideo.append(item.link)
        }
        tableView.reloadData()
    }
    
    func setupVideoError() {
//        guard let content = VideoModel().content else { return }
//        setupVideo(content: content)
    }
}

extension VideoScreenTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension VideoScreenTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVideo.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? VideoTableViewCell {
            
            let isDark = traitCollection.userInterfaceStyle == .dark
            let colorWhite = isDark ? UIColor.white : UIColor.black
            let colorDark = isDark ? UIColor.black : UIColor.white
            
            cell.loadingView.backgroundColor = colorDark
            cell.loadingIndicator.color = colorWhite
            cell.loadingView.clipsToBounds = true
            cell.videoView.clipsToBounds = true
            let radius = 15.0
            cell.loadingView.layer.cornerRadius = radius
            cell.videoView.layer.cornerRadius = radius
            
            cell.loadVideo(arrayVideo[indexPath.row])
            
            return cell
        }

        return UITableViewCell()
    }
    
    private func updateTheme() {
//        let isDark = traitCollection.userInterfaceStyle == .dark
        
//        let colorWhite = isDark ? UIColor.white : UIColor.black
//        let colorDark = isDark ? UIColor.black : UIColor.white
        
        self.tableView.reloadData()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}
