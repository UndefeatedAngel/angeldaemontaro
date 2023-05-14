//
//  ProfileViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 14.05.23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBackButton(complete: #selector(backClick))
        setupNavTitle(text: getLocale(key: "profileMenu"))
        updateTheme()
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
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}
