//
//  MainContainerViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.10.23.
//

import UIKit
import GoogleMobileAds

class MainContainerViewController: UIViewController {
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var bannerView: GADBannerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView = addBannerViewToView()
        guard let bannerView = bannerView else { return }
        
        var adUnitID = ""
        
        if AdsManager.shared.isTestAds() {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyBannerTest") as? String ?? ""
        } else {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyBannerProd") as? String ?? ""
        }
        
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        bottomConstraint.constant = bannerView.frame.height + 10.0
        
        AdsManager.shared.showOpenAds(self)
    }
    
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        view.backgroundColor = colorDark
        view.tintColor = colorWhite
        
        guard let bannerView = bannerView else { return }
        bannerView.backgroundColor = colorDark
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}
