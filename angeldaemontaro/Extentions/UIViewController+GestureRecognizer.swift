//
//  UIViewController+GestureRecognizer.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 13.09.22.
//

import Foundation
import UIKit

extension UIViewController {
    func addLeftBackButton(view: UIView) {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(backClick(_:)))
        gesture.direction = .left
        view.addGestureRecognizer(gesture)
    }
    
    @objc
    private func backClick(_ sender: UISwipeGestureRecognizer) {
        dismiss(animated: true)
    }
}
