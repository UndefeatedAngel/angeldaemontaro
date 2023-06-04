//
//  UIViewController+Navigation.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 19.04.23.
//

import UIKit

extension UIViewController {
    
    func setupNavBackButton(complete: Selector) {
        
        let button = UIBarButtonItem(image: Assets.Images.back.image, style: .plain, target: self, action: complete)
        self.navigationItem.leftBarButtonItems = [button]
    }
    
    func setupNavTitle(text: String) {
        self.navigationItem.title = text
    }
    
    func setupSoundsNav() {
        let button = UIBarButtonItem(image: Settings.isSounds
                                     ? Assets.Images.soundOn.image
                                     : Assets.Images.soundOff.image,
                                     style: .plain, target: self, action: #selector(actionSoundClick))
        self.navigationItem.rightBarButtonItems = [button]
    }
    
    @objc
    func actionSoundClick() {
        Settings.isSounds = !Settings.isSounds
        self.navigationItem.rightBarButtonItems?[0].image = Settings.isSounds
        ? Assets.Images.soundOn.image
        : Assets.Images.soundOff.image
        AVPlayerManager.isSoundUpdate()
    }
}
