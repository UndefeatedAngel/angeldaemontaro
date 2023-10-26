//
//  SettingsViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 11.07.22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var languageTitle: UILabel!
    @IBOutlet weak var themeTitle: UILabel!
    @IBOutlet weak var soundsTitle: UILabel!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var themeButton: UIButton!
    @IBOutlet weak var onOffButton: UIButton!
    
    var language: LanguageModel = .en
    var theme: ThemeModel = .light
    var sounds: SoundsModel = .on
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavTitle(text: getLocale(key: "settingsMenu"))
        setupNavBackButton(complete: #selector(backClick))
        updateTheme()
        
        addLeftBackButton(view: self.view)
        
        language = Settings.language == "ru" ? .ru : .en
        
        sounds = Settings.isSounds ? .on : .off
        theme = Settings.theme == "dark" ? .dark : .light
  
        updateLanguage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logScreen(screenName: "Settings", screenClass: String(describing: self))
    }
    
    @objc
    func backClick() {
        self.dismiss(animated: true)
    }
    
    @IBAction func languageClick(_ sender: Any) {
        if language == .en {
            language = .ru
            logEventClick(title: "settings", item: "language_ru")
        } else {
            language = .en
            logEventClick(title: "settings", item: "language_en")
        }
        
        Bundle.setLanguage(lang: language.rawValue)

        updateLanguage()
        
    }
    
    @IBAction func themeClick(_ sender: Any) {
        if theme == .light {
            theme = .dark
            logEventClick(title: "settings", item: "theme_dark")
        } else {
            theme = .light
            
            logEventClick(title: "settings", item: "theme_light")
        }
        
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.overrideUserInterfaceStyle = theme == .dark ? .dark : .light
        
        Settings.theme = theme == .dark ? "dark" : "light"
        
        updateLanguage()
    }
    
    @IBAction func soundsClick(_ sender: Any) {
        
        if sounds == .on {
            sounds = .off
            logEventClick(title: "settings", item: "sounds_off")
        } else {
            sounds = .on
            logEventClick(title: "settings", item: "sounds_on")
        }
        
        Settings.isSounds = sounds == .on

        updateLanguage()
    }
    
    func updateLanguage() {
        
        languageButton.setTitle( getLocale(key: language.description), for: .normal)
        languageTitle.text = getLocale(key: "language")
        
        themeButton.setTitle(getLocale(key: theme.description), for: .normal)
        themeTitle.text = getLocale(key: "theme")
        
        onOffButton.setTitle(getLocale(key: sounds.description), for: .normal)
        soundsTitle.text = getLocale(key: "sounds")
        
        setupNavTitle(text: getLocale(key: "settingsMenu"))
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
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
    }
}
