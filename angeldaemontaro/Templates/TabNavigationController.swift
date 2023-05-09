//
//  TabNavigationController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.04.23.
//

import UIKit

class TabNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        updateTheme()
    }
    
    private func updateTheme() {
        var isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite: UIColor = isDark ? .white : .black
        let colorDark: UIColor = isDark ? .black : .white
        
        let navBar = self.navigationBar
        navBar.backgroundColor = colorDark
        navBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorWhite
        ]
        navBar.tintColor = colorWhite
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}
