//
//  UIColor+Hex.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 9.05.23.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            self.init(cgColor: UIColor.gray.cgColor)
            return
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        let color = UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
            
        self.init(cgColor: color.cgColor)
    }
}
