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
            photoImageView.layer.borderWidth = 3
            photoImageView.layer.borderColor = traitCollection.userInterfaceStyle == .dark ?
            UIColor.white.cgColor : UIColor.black.cgColor
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
            aboutLabel.text = getLocale(key: "about_profile")
        }
    }
    @IBOutlet weak var aboutText: UILabel! {
        didSet {
            aboutText.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        }
    }
    
    @IBOutlet weak var consultationButton: UIButton! {
        didSet {
            consultationButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            consultationButton.clipsToBounds = true
            consultationButton.layer.cornerRadius = 10
            consultationButton.setTitle(getLocale(key: "highprietess_consultation_button"), for: .normal)
            
        }
    }
    @IBOutlet weak var openSiteButton: UIButton! {
        didSet {
            openSiteButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            openSiteButton.clipsToBounds = true
            openSiteButton.layer.cornerRadius = 10
            openSiteButton.setTitle(getLocale(key: "highprietess_site_button"), for: .normal)
        }
    }
    @IBOutlet weak var viewBackground: UIView!
    
    @IBOutlet weak var viewCorner: UIView! {
        didSet {
            viewCorner.clipsToBounds = true
            viewCorner.layer.cornerRadius = 25
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBackButton(complete: #selector(backClick))
        setupNavTitle(text: getLocale(key: "profileMenu"))
        
        let editButton = UIBarButtonItem(title: getLocale(key: "edit_nav_button"),
                                         style: .plain, target: self, action: #selector(editClick))
        self.navigationItem.rightBarButtonItems = [editButton]
        setup()
        updateTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logScreen(screenName: "Profile", screenClass: String(describing: self))
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
        if !nameText.elementsEqual("") {
            setupNavTitle(text: nameText)
        }
        
        let formated = DateFormatter()
        formated.dateStyle = .medium
        formated.timeStyle = .none
        bithDayLabel.text = formated.string(from: ProfileSave.dateBith ?? Date())
        
        if let today = ProfileSave.dateBith {
            let all = [Zodiac.aries, .taurus, .gemini, .cancer,
                .leo, .virgo, .libra, .scorpio, .sagittarius, .capricorn, .aquarius, .pisces]
            for sign in all where sign.getRange(now: today).contains(today) {
                zodiakLabel.text = getLocale(key: "\(sign.rawValue)_text")
                break
            }
        }
        
        if let about = ProfileSave.about {
            aboutText.text = about
        }
    }
    
    @objc
    func editClick() {
        logEventClick(title: "profile", item: "editProfile")
        performSegue(withIdentifier: StoryboardSegue.Profile.editProfileSegue.rawValue, sender: self)
    }
    
    @objc
    func backClick() {
        logEventClick(title: "profile", item: "back")
        self.dismiss(animated: true)
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
        viewBackground.backgroundColor = colorDark
        viewCorner.backgroundColor = colorDark
        var color = colorWhite
        color = color.withAlphaComponent(0.6)
        bithDayLabel.textColor = color
        aboutLabel.textColor = color
        aboutText.textColor = colorWhite
        consultationButton.backgroundColor = colorWhite
        openSiteButton.backgroundColor = colorWhite
        consultationButton.tintColor = colorWhite
        openSiteButton.tintColor = colorWhite
        
        consultationButton.setTitleColor(colorDark, for: .normal)
        openSiteButton.setTitleColor(colorDark, for: .normal)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
    
    private func setup() {
        zodiakLabel.text = generateZodiak()
        photoImageView.image = Assets.Images.emptyProfile.image
        let firstName = "First Name"
        let lastName = "Last Name"
        nameLabel.text = "\(firstName) \(lastName)"
    }
    
    private func generateZodiak() -> String {
        return "Empty"
    }
}
