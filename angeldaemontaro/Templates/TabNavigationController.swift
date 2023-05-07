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
        
        UINavigationBar.appearance().tintColor = colorWhite
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = colorDark
        
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorWhite
        ]
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}
