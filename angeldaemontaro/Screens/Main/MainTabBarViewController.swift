//
//  ViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 17.04.23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        guard let cardOfDay = createViewController("CardOfDay", "cardOfDaysSB") else { return }
        guard let angels = createViewController("Angels", "angelsSB") else { return }
        guard let tarots = createViewController("Tarots", "tarotsSB") else { return }
        guard let video = createViewController("Video", "videoSB") else { return }
        
        viewControllers = [cardOfDay, tarots, angels, video]
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationSwipe(viewControllers: tabBarController.viewControllers)
    }
}



