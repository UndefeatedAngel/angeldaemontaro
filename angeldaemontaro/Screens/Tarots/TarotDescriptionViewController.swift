//
//  TarotDescriptionViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit
import GoogleMobileAds

class TarotDescriptionViewController: UIViewController, GADNativeAdLoaderDelegate, GADNativeAdDelegate {
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        
    }
    
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        nativeAdList.append(nativeAd)
    }

    func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
        for index in 0..<nativeAdList.count {
            let nativeAd = nativeAdList[index]
            let space4 = space4ViewList[index]
            let isDark = traitCollection.userInterfaceStyle == .dark
            let colorWhite = isDark ? UIColor.white : UIColor.black
            let view = AdsManager.shared.getNativeAdView(nativeAd: nativeAd, viewController: self, textColor: colorWhite)
            guard let view = view  else { return }
            let nativeView = nativeAdsViewList[index]
            nativeView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leftAnchor.constraint(equalTo: nativeView.leftAnchor).isActive = true
            view.topAnchor.constraint(equalTo: nativeView.topAnchor).isActive = true
            view.rightAnchor.constraint(equalTo: nativeView.rightAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: nativeView.bottomAnchor).isActive = true
            nativeView.isHidden = false
            space4.isHidden = false
        }
        stackView.layoutIfNeeded()
        updateTheme()
    }
    
    var nativeAdList: [GADNativeAd] = []
    var nativeAdsViewList: [UIView] = []
    var space4ViewList: [UIView] = []
    
    private let keyMapOfDay = "buttomMapOfDay"
    private let keyMapOfDaySave = "cardOfDaySave"
    
    var currentSave: String = ""
    var tarotField: String = ""
    var content: TarotSpreadModel.TarotSpreadJson?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var space1: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var space2: UIView!
    @IBOutlet weak var desciptionLabel: UILabel!
    @IBOutlet weak var space3: UIView!
    @IBOutlet weak var nativeAds: UIView!
    @IBOutlet weak var space4: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureTabBar()

        content = TarotSpreadModel().contents?.first(where: { json in
            return json.save == tarotField
        })

        createDescription()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        setupNavTitle(text: getLocale(key: content?.title ?? ""))
        
        updateTheme()
        
        let model = getModelJsonFromSave(saveField: currentSave)
        AdsManager.shared.loadNative(viewController: self, count: model.count)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logScreen(screenName: "TarotDetail", screenClass: String(describing: self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.backItem?.title = ""
        
        let maxCount = 3
        AdsData.intertitialCount += 1
        if AdsData.intertitialCount > maxCount {
            AdsManager.shared.showInterstitial(self)
            AdsData.intertitialCount = 0
        }
    }
    
    func createDescription() {
        guard let content = content else { return }

        let model = getModelJsonFromSave(saveField: currentSave)

        for index in 0..<model.count {
            let localeTitle = getLocaleFromTable(tableName: content.locale, key: "title_\(index)")
            let keyDescription = model[index].description
            let localePoint = getLocaleFromTable(tableName: content.locale, key: keyDescription)

            addDescription(title: localeTitle,
                           image: model[index].image.getImageLocale(controller: self), description: localePoint)
        }
    }
    
    func addDescription(title: String, image: UIImage?, description: String) {
        if let copyTitle = titleLabel.createCopy() as? UILabel {
            copyTitle.text = title
            copyTitle.isHidden = false
            stackView.addArrangedSubview(copyTitle)
        }
        
        if let copySpace1 = space1.createCopy() {
            copySpace1.isHidden = false
            stackView.addArrangedSubview(copySpace1)
        }
        
        if let copyImageView = imageView.createCopy() as? UIImageView {
            copyImageView.image = image
            copyImageView.isHidden = false
            stackView.addArrangedSubview(copyImageView)
        }
        
        if let copySpace2 = space2.createCopy() {
            copySpace2.isHidden = false
            stackView.addArrangedSubview(copySpace2)
        }
        
        if let copyDescription = desciptionLabel.createCopy() as? UILabel {
            copyDescription.text = description
            copyDescription.isHidden = false
            stackView.addArrangedSubview(copyDescription)
        }
        
        if let copySpace3 = space3.createCopy() {
            copySpace3.isHidden = false
            stackView.addArrangedSubview(copySpace3)
        }
        
        if let nativeAds = nativeAds.createCopy() {
            nativeAdsViewList.append(nativeAds)
            stackView.addArrangedSubview(nativeAds)
        }
        
        if let copySpace4 = space4.createCopy() {
            space4ViewList.append(copySpace4)
            stackView.addArrangedSubview(copySpace4)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
    
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        for view in stackView.arrangedSubviews {
            if let label = view as? UILabel {
                label.textColor = colorWhite
            }
        }
        
        for view in nativeAdsViewList {
            guard let nativeAdView = view.subviews.first as? GADNativeAdView else { return }
            (nativeAdView.headlineView as? UILabel)?.textColor = colorWhite
            (nativeAdView.advertiserView as? UILabel)?.textColor = colorWhite
            (nativeAdView.bodyView as? UILabel)?.textColor = colorWhite
            (nativeAdView.storeView as? UILabel)?.textColor = colorWhite
            (nativeAdView.priceView as? UILabel)?.textColor = colorWhite
            if let nativeCall = (nativeAdView.callToActionView as? UIButton) {
                nativeCall.setTitleColor(colorWhite, for: .normal)
                nativeCall.backgroundColor = colorDark
            }
        
            nativeAdView.clipsToBounds = true
            nativeAdView.layer.borderWidth = 2
            nativeAdView.layer.borderColor = colorWhite.cgColor
        }
    }
}
