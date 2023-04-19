//
//  UIViewController+TabBar.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.04.23.
//

import UIKit

extension UIViewController {
    public func setupGestureTabBar() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeTabBar(_:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeTabBar(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc
    private func swipeTabBar(_ gesture: UISwipeGestureRecognizer) {
        guard let tabBarController = tabBarController, let viewControllers = tabBarController.viewControllers else { return }
        let tabs = viewControllers.count
        if gesture.direction == .left {
          if tabBarController.selectedIndex < tabs {
              tabBarController.selectedIndex += 1
          }
        } else if gesture.direction == .right {
          if tabBarController.selectedIndex > 0 {
              tabBarController.selectedIndex -= 1
          }
        }
    }
}
