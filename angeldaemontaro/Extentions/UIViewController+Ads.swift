//
//  UIViewController+Ads.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.10.23.
//

import UIKit
import GoogleMobileAds

extension UIViewController: GADBannerViewDelegate, GADFullScreenContentDelegate {
    public static var sizeBanner = 0.0
    
    func addBannerViewToView() -> GADBannerView {
        let bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
          [NSLayoutConstraint(item: bannerView,
                              attribute: .bottom,
                              relatedBy: .equal,
                              toItem: view.safeAreaLayoutGuide,
                              attribute: .bottom,
                              multiplier: 1,
                              constant: 0),
           NSLayoutConstraint(item: bannerView,
                              attribute: .centerX,
                              relatedBy: .equal,
                              toItem: view,
                              attribute: .centerX,
                              multiplier: 1,
                              constant: 0)
          ])
        
        bannerView.delegate = self
        UIViewController.sizeBanner = bannerView.frame.size.height
        return bannerView
    }
}
