//
//  BaseTarotViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 13.08.22.
//

import UIKit

class BaseTarotViewController: UIViewController {
    var arrayViews = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureTabBar()
    }

    func animateCardDay(imageView: UIImageView, finished: @escaping (Bool) -> Void) {
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionFlipFromRight,
                          animations: nil,
                          completion: finished)
    }
}
