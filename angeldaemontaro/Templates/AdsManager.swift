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
}
