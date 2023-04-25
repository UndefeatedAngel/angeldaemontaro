//
//  Appearance.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 19.04.23.
//

import UIKit

class Appearance {
    public static func setup() {
        let color = UIColor.white
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold),
            NSAttributedString.Key.foregroundColor: color]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
}
