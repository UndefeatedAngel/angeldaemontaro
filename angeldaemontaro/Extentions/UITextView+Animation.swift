//
//  TextView+Animation.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 28.04.23.
//

import UIKit

extension UITextView {
    func animation(typing value: String, duration: Double) {
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            self.layoutIfNeeded()
            self.text = value
        }, completion: { finished in
            print("Animation completed")
        })
    }
}
