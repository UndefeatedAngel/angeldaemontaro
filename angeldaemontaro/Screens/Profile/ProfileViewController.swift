//
//  ProfileViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 14.05.23.
//

import UIKit

class ProfileViewController: UIViewController {
    var isEditProfile: Bool = false
    @IBOutlet weak var zodiakLabel: UILabel! {
        didSet {
            zodiakLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        }
    }
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.clipsToBounds = true
            photoImageView.layer.cornerRadius = photoImageView.bounds.height / 2
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        }
    }
    @IBOutlet weak var bithDayLabel: UILabel! {
        didSet {
            bithDayLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        }
    }
    @IBOutlet weak var aboutLabel: UILabel! {
        didSet {
            aboutLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        }
    }
    @IBOutlet weak var aboutText: UILabel! {
        didSet {
            aboutText.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        }
    }
    @IBOutlet weak var selfButton: UIButton! {
        didSet {
            
        }
    }
    @IBOutlet weak var consultationButton: UIButton! {
        didSet {
            
        }
    }
    @IBOutlet weak var buyButton: UIButton! {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBackButton(complete: #selector(backClick))
        setupNavTitle(text: getLocale(key: "profileMenu"))
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editClick))
        self.navigationItem.rightBarButtonItems = [editButton]
        setup()
        updateTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let image = UIImage(data: ProfileSave.image ?? Data())
        photoImageView.image = image
        var nameText = ""
        if let firstName = ProfileSave.firstName {
            nameText.append(firstName)
        }
        if let lastName = ProfileSave.lastName {
            nameText.append(" \(lastName)")
        }
        nameLabel.text = nameText
        
        let formated = DateFormatter()
        formated.dateStyle = .medium
        formated.timeStyle = .none
        bithDayLabel.text = formated.string(from: ProfileSave.dateBith ?? Date())
        if let about = ProfileSave.about {
            aboutText.text = about
        }
    }
    
    @objc
    func editClick() {
        performSegue(withIdentifier: StoryboardSegue.Profile.editProfileSegue.rawValue, sender: self)
    }
    
    @objc
    func backClick() {
        self.dismiss(animated: true)
    }
    
    // MARK: Update Theme
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
//        let colorDark = isDark ? UIColor.black : UIColor.white
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorWhite,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold)
        ]
        
        navigationItem.leftBarButtonItems?[0].tintColor = colorWhite
        navigationItem.rightBarButtonItems?[0].tintColor = colorWhite
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
    
    private func setup() {
        zodiakLabel.text = generateZodiak()
        photoImageView.image = Assets.Images.emptyProfile.image
        let firstName = "Александр"
        let lastName = "Лаптев"
        nameLabel.text = "\(firstName) \(lastName)"
    }
    
    private func generateZodiak() -> String {
        return "Овен"
    }
}
