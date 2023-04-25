//
//  UIViewController+Storyboard.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.04.23.
//

import UIKit

extension UIViewController {
    func createViewController(_ storyboardName: String,
                              _ storyboardID: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardID)
        return controller
    }
}
