//
//  AdsManager.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 19.10.23.
//

import UIKit
import GoogleMobileAds

class AdsManager {
    static var shared: AdsManager = {
        let instance = AdsManager()
        return instance
    }()
    
    private var reward: GADRewardedAd?
    private var activeReward: GADRewardedAd?
    private var native: GADAdLoader?
    
    func isTestAds() -> Bool {
        return Bundle.main.object(forInfoDictionaryKey: "ADSIsTest") as? Bool ?? true
    }
    
    func showOpenAds(_ viewController: UIViewController) {
        var adUnitID = ""
        
        if isTestAds() {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyStartTest") as? String ?? ""
        } else {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyStartProd") as? String ?? ""
        }
        
        GADAppOpenAd.load(
              withAdUnitID: adUnitID,
              request: GADRequest(),
              orientation: UIInterfaceOrientation.portrait
        ) { [weak viewController] ad, error in
            guard let viewController = viewController, let ad = ad else { return }
            
            if let error = error {
                print("App open ad failed to load with error: \(error.localizedDescription)")
                return
            }
            
            ad.fullScreenContentDelegate = viewController
            ad.present(fromRootViewController: viewController)
            print("App open ad loaded successfully.")
        }
        
    }
    
    func showInterstitial(_ viewController: UIViewController) {
        var adUnitID = ""
        
        if isTestAds() {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyInterstitialTest") as? String ?? ""
        } else {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyInterstitialProd") as? String ?? ""
        }
        
        let request = GADRequest()
        GADInterstitialAd.load(
            withAdUnitID: adUnitID,
            request: request,
            completionHandler: { [weak viewController] ad, error in
                guard let viewController = viewController, let ad = ad else { return }
                if let error = error {
                  print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                  return
                }
                
                ad.fullScreenContentDelegate = viewController
                ad.present(fromRootViewController: viewController)
            })
    }
    
    func loadRewarded() {
        var adUnitID = ""
        
        if isTestAds() {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyRewardTest") as? String ?? ""
        } else {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyRewardProd") as? String ?? ""
        }
        
        let request = GADRequest()
        GADRewardedAd.load(
            withAdUnitID: adUnitID,
            request: request,
            completionHandler: {[weak self] ad, error in
                guard let ad = ad else { return }
                if let error = error {
                  print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                  return
                }
                self?.reward = ad
            })
    }
    
    func showReward(_ viewController: UIViewController, count: Int, key: String, _ ok: @escaping () -> Void) {
        if let ad = reward {
            viewController.showAlertWithReward(count: count, key: key) { [weak self] in
                guard let self = self else { return }
                self.activeReward = ad
                self.activeReward?.fullScreenContentDelegate = viewController
                self.activeReward?.present(fromRootViewController: viewController) { [weak self] in
                    guard let self = self else { return }
                    AdsData.setRewardType(type: key, count: 0)
                    self.activeReward = nil
                    ok()
                }

                self.reward = nil
                loadRewarded()
            }
        } else {
            viewController.showAlertWithRewardNoAds()
        }
    }
    
    func loadNative(viewController: GADNativeAdLoaderDelegate, count: Int) {
        
        guard let vc = viewController as? UIViewController else { return }
        
        var adUnitID = ""
        
        if isTestAds() {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyNativeTest") as? String ?? ""
        } else {
            adUnitID = Bundle.main.object(forInfoDictionaryKey: "AdsKeyNativeProd") as? String ?? ""
        }
        
        let multipleAdOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdOptions.numberOfAds = count
        
        native = GADAdLoader(adUnitID: adUnitID,
            rootViewController: vc,
            adTypes: [ .native ],
            options: [ multipleAdOptions ])
        
        guard let native = native else { return }

        native.delegate = viewController
        native.load(GADRequest())
    }
    
    func imageOfStars(from starRating: NSDecimalNumber?) -> UIImage? {
       guard let rating = starRating?.doubleValue else {
         return nil
       }
       if rating >= 5 {
         return UIImage(named: "stars_5")
       } else if rating >= 4.5 {
         return UIImage(named: "stars_4_5")
       } else if rating >= 4 {
         return UIImage(named: "stars_4")
       } else if rating >= 3.5 {
         return UIImage(named: "stars_3_5")
       } else {
         return nil
       }
    }
    
    func getNativeAdView(nativeAd: GADNativeAd, viewController: GADNativeAdDelegate, textColor: UIColor) -> GADNativeAdView? {
        // Create and place ad in view hierarchy.
        let nibView = Bundle.main.loadNibNamed("NativeAdView", owner: nil, options: nil)?.first
        
        guard let nativeAdView = nibView as? GADNativeAdView else { return nil }
        // Set ourselves as the native ad delegate to be notified of native ad events.
        nativeAd.delegate = viewController

        // Populate the native ad view with the native ad assets.
        // The headline and mediaContent are guaranteed to be present in every native ad.
        (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
        (nativeAdView.headlineView as? UILabel)?.textColor = textColor
        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

        // This app uses a fixed width for the GADMediaView and changes its height to match the aspect
        // ratio of the media it displays.
        if let mediaView = nativeAdView.mediaView, nativeAd.mediaContent.aspectRatio > 0 {
          let heightConstraint = NSLayoutConstraint(
            item: mediaView,
            attribute: .height,
            relatedBy: .equal,
            toItem: mediaView,
            attribute: .width,
            multiplier: CGFloat(1 / nativeAd.mediaContent.aspectRatio),
            constant: 0)
          heightConstraint.isActive = true
        }

        // These assets are not guaranteed to be present. Check that they are before
        // showing or hiding them.
        (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
        (nativeAdView.bodyView as? UILabel)?.textColor = textColor
        nativeAdView.bodyView?.isHidden = nativeAd.body == nil

        if let nativeCallButton = nativeAdView.callToActionView as? UIButton {
            nativeCallButton.setTitle(nativeAd.callToAction, for: .normal)
            nativeCallButton.setTitleColor(textColor, for: .normal)
            nativeCallButton.clipsToBounds = true
            nativeCallButton.layer.cornerRadius = 10
        }
        
        nativeAdView.callToActionView?.isHidden = nativeAd.callToAction == nil

        (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        nativeAdView.iconView?.isHidden = nativeAd.icon == nil

        (nativeAdView.starRatingView as? UIImageView)?.image = imageOfStars(from: nativeAd.starRating)
        nativeAdView.starRatingView?.isHidden = nativeAd.starRating == nil

        (nativeAdView.storeView as? UILabel)?.text = nativeAd.store
        (nativeAdView.storeView as? UILabel)?.textColor = textColor
        nativeAdView.storeView?.isHidden = nativeAd.store == nil

        (nativeAdView.priceView as? UILabel)?.text = nativeAd.price
        (nativeAdView.priceView as? UILabel)?.textColor = textColor
        nativeAdView.priceView?.isHidden = nativeAd.price == nil

        (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
        (nativeAdView.advertiserView as? UILabel)?.textColor = textColor
        nativeAdView.advertiserView?.isHidden = nativeAd.advertiser == nil

        // In order for the SDK to process touch events properly, user interaction should be disabled.
        nativeAdView.callToActionView?.isUserInteractionEnabled = false

        // Associate the native ad view with the native ad object. This is
        // required to make the ad clickable.
        // Note: this should always be done after populating the ad views.
        nativeAdView.nativeAd = nativeAd
        nativeAdView.mediaView?.contentMode = .scaleAspectFill
        
//        nativeAdView.mediaView?.isHidden = true
//        nativeAdView.callToActionView?.isHidden = true
//        nativeAdView.priceView?.isHidden = true
        nativeAdView.advertiserView?.isHidden = true
        nativeAdView.starRatingView?.isHidden = true
//        nativeAdView.storeView?.isHidden = true
        nativeAdView.backgroundColor = .clear
        
        if let stack = nativeAdView.subviews.first {
            nativeAdView.frame.size.width = stack.frame.size.width
            nativeAdView.frame.size.height = stack.frame.size.height
        }
     
        return nativeAdView
    }
}
