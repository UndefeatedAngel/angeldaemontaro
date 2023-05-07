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
        
        let cardOfDay = StoryboardScene.CardOfDay.cardOfDaysSB.instantiate()
        let angels = StoryboardScene.Angels.angelsSB.instantiate()
        let tarots = StoryboardScene.Tarots.tarotsSB.instantiate()
        let video = StoryboardScene.Video.videoSB.instantiate()
        
        viewControllers = [cardOfDay, tarots, angels, video]
        
        updateTheme()
    }
    
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        tabBar.backgroundColor = colorDark
        tabBar.tintColor = colorWhite
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController,
                          animationControllerForTransitionFrom fromVC: UIViewController,
                          to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationSwipe(viewControllers: tabBarController.viewControllers)
    }
}
