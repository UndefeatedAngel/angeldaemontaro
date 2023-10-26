//
//  HighPriestessViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.04.23.
//

import UIKit
import AVKit
import AVFoundation

class HighPriestessViewController: UIViewController {
    
    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var videoActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var consultationButton: UIButton! {
        didSet {
            consultationButton.layer.masksToBounds = true
            consultationButton.layer.cornerRadius = 10
            consultationButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            consultationButton.setTitle(getLocale(key: "highprietess_consultation_button"), for: .normal)
            consultationButton.addTarget(
                self,
                action: #selector(onClickConsultationButton),
                for: .touchUpInside)
        }
    }
    @IBOutlet weak var openSiteButton: UIButton! {
        didSet {
            openSiteButton.layer.masksToBounds = true
            openSiteButton.layer.cornerRadius = 10
            openSiteButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            openSiteButton.setTitle(getLocale(key: "highprietess_site_button"), for: .normal)
            openSiteButton.addTarget(
                self,
                action: #selector(onClickOpenSiteButton),
                for: .touchUpInside)
        }
    }
    @IBOutlet weak var socialStackView: UIStackView!
    
    @IBOutlet weak var pauseButton: UIButton!
    var buttonsSocial = [[]]
    var isPauseVideo: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavTitle(text: getLocale(key: "highprietess_title"))
        setupVideo()
        setupNavBackButton(complete: #selector(backClick))
        setupSoundsNav()
        setupTextView()
        setupSocial()
        updateTheme()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(finishVideoPlayer),
            name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(foreroundAction),
            name: UIApplication.willEnterForegroundNotification, object: nil)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {
            print("Error")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logScreen(screenName: "HighPriestess", screenClass: String(describing: self))
    }
    
    @objc
    func backClick() {
        self.dismiss(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AVPlayerManager.avPlayer = nil
        AVPlayerManager.stopSpeak()
    }
    
    // MARK: Setup Video
    private func setupVideo() {
        pauseButton.setImage(UIImage(), for: .normal)
        videoActivityIndicator.startAnimating()
        if let avPlayer = attachVideo(name: "promo2", extention: "MOV", view: videoPlayerView) {
            avPlayer.volume = 1.0
            AVPlayerManager.avPlayer = avPlayer
            videoActivityIndicator.stopAnimating()
            AVPlayerManager.playVideo()
            AVPlayerManager.playSpeak(text: getLocale(key: "highprietess_description"))
        }
    }
    
    // MARK: Setup TextView
    private func setupTextView() {
        let text = getLocale(key: "highprietess_description")
        descriptionTextView.text = text
        descriptionTextView.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    // MARK: Setup Social
    private func setupSocial() {
        let tiktok = ["tiktok", "https://tiktok.com/@angel.daemon.taro"]
        let youtube = ["youtube", "https://youtube.com/channel/UCIukCEupRBzhdsOTa7RLdMA"]
        let zen = ["zen", "https://zen.yandex.ru/profile/editor/id/62beeb66396f275a086435f2"]
        let facebook  = ["facebook", "https://www.facebook.com/profile.php?id=100082897029310"]
        let instagram = ["instagram", "https://instagram.com/_angel_daemon_taro_?igshid=YmMyMTA2M2Y="]
        let telegram  = ["telegram", "https://t.me/anlel_daemon_taro"]
        buttonsSocial = [tiktok, youtube, zen, facebook, instagram, telegram]
        
        for tarSocial in 0..<buttonsSocial.count {
            let socialButton = UIButton(type: .custom)
            if let name = buttonsSocial[tarSocial][0] as? String {
                socialButton.setImage(UIImage(named: name), for: .normal)
                socialButton.tag = tarSocial
                socialButton.addTarget(
                    self,
                    action: #selector(onClickSocialButton),
                    for: .touchUpInside)
                socialStackView.addArrangedSubview(socialButton)
            }
        }
    }
    
    // MARK: Update Theme
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorWhite,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold)
        ]
        
        navigationItem.leftBarButtonItems?[0].tintColor = colorWhite
        navigationItem.rightBarButtonItems?[0].tintColor = colorWhite
        descriptionTextView.textColor = colorWhite
        
        consultationButton.tintColor = colorDark
        consultationButton.backgroundColor = colorWhite
        
        openSiteButton.tintColor = colorDark
        openSiteButton.backgroundColor = colorWhite
    }
    
    // MARK: Click Actions
    @objc
    private func onClickSocialButton(sender: UIButton) {
        if let urlString = buttonsSocial[sender.tag][1] as? String {
            UIApplication.shared.open(URL(string: urlString)!)
            if let item = buttonsSocial[sender.tag][0] as? String {
                logEventClick(title: "highprietess", item: item)
            }
        }
    }
    
    @objc
    private func onClickConsultationButton(sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://t.me/angeldaemontaro_bot")!)
        logEventClick(title: "highprietess", item: "consultation")
    }
    
    @objc
    private func onClickOpenSiteButton(sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://angeldaemontaro.com/")!)
        logEventClick(title: "highprietess", item: "opensite")
    }
    
    @objc
    private func finishVideoPlayer() {
        guard let avPlayer = AVPlayerManager.avPlayer else { return }
        
        pauseButton.setImage(Assets.Images.playerPlay.image, for: .normal)
        avPlayer.seek(to: .zero)
        isPauseVideo = true
        logEventClick(title: "highprietess", item: "finishVideo")
    }
    
    @objc
    private func foreroundAction() {
        guard isPauseVideo == false else { return }
        
        AVPlayerManager.playVideo()
    }
    
    @IBAction func onClickPause(_ sender: Any) {
        guard let avPlayer = AVPlayerManager.avPlayer else { return }
        
        if isPauseVideo {
            pauseButton.setImage(UIImage(), for: .normal)
            
            AVPlayerManager.playVideo()
            AVPlayerManager.playSpeak(text: "highprietess_description")
            logEventClick(title: "highprietess", item: "resumeVideo")
        } else {
            pauseButton.setImage(Assets.Images.playerPlay.image, for: .normal)
            AVPlayerManager.pauseSpeak()
            avPlayer.pause()
            logEventClick(title: "highprietess", item: "pauseVideo")
        }
        
        isPauseVideo = !isPauseVideo
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}
