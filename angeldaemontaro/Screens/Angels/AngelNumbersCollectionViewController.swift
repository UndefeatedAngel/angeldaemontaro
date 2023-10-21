//
//  File.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 27.03.23.
//

import UIKit
import GoogleMobileAds

class AngelNumbersCollectionViewController: UIViewController, GADNativeAdLoaderDelegate, GADNativeAdDelegate {
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        
    }
    
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        // A native ad has loaded, and can be displayed.
        nativeAds.append(nativeAd)
    }

    func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
        
        if nativeAds.count <= 0 {
          return
        }

        let adInterval = (tableViewItems.count / nativeAds.count) + 1
        var index = 0
        for nativeAd in nativeAds {
          if index < tableViewItems.count {
            tableViewItems.insert(nativeAd, at: index)
            index += adInterval
          } else {
            break
          }
        }
        self.collectionView.reloadData()
    }
    
    private let segue = "angelNumbersDescriptionSegue"
    let angelNumbers = AngelNumbersCardsDayModel()
    var numberSection = 0
    var numberRow = 0
    
    var nativeAds: [GADNativeAd] = []
    var tableViewItems = [AnyObject]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundView = UIImageView(image: UIImage(named: "background"))
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        setupGestureTabBar()
        
        let countNativeAds = 5
        AdsManager.shared.loadNative(viewController: self, count: countNativeAds)
        
        guard let cards = self.angelNumbers.content?[numberSection].cards else { return }
        for card in cards {
            tableViewItems.append(card as AnyObject)
        }
        self.collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = getLocale(key: "angelsMenu")
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let card = tableViewItems[numberRow] as? AngelNumbersCardsDayModel.AngelNumbersCardsJson  else { return }
                        
        if let descruptionController = segue.destination as? AngelNumbersDescriptionViewController {
            descruptionController.json = card
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    func getImage(card: AngelNumbersCardsDayModel.AngelNumbersCardsJson) -> UIImage? {
        let imageName = card.image
        return UIImage(named: imageName)
    }
}

extension AngelNumbersCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        numberSection = indexPath.section
        numberRow = indexPath.row
        
        performSegue(withIdentifier: segue, sender: self)
    }
}

extension AngelNumbersCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableViewItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let card = tableViewItems[indexPath.row] as? AngelNumbersCardsDayModel.AngelNumbersCardsJson {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AngelNumbersCollectionViewCell.reuseID,
                                                             for: indexPath) as? AngelNumbersCollectionViewCell {
                cell.angelNumbersImageView?.image = getImage(card: card)
                cell.contentView.clipsToBounds = true
                cell.contentView.layer.cornerRadius = 10
                return cell
            }
        } else {
            
            let nativeAd = tableViewItems[indexPath.row] as? GADNativeAd
            
            guard let nativeAd = nativeAd else { return UICollectionViewCell()}
            /// Set the native ad's rootViewController to the current view controller.
            nativeAd.rootViewController = self

            let nativeAdCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "nativeAdViewCell", for: indexPath)
            
            guard let nativeAdView = AdsManager.shared.getNativeAdView(nativeAd: nativeAd, viewController: self) else {
                return UICollectionViewCell()
            }
            nativeAdCell.contentView.addSubview(nativeAdView)
            nativeAdView.frame = nativeAdCell.contentView.frame
              
            return nativeAdCell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(
        _ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
            
        if let sectionHeader =
            collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                            withReuseIdentifier: AngelNumbersSectionReusableView.reuseID,
                                                            for: indexPath) as? AngelNumbersSectionReusableView {
            sectionHeader.label.text = getLocale(key: angelNumbers.content?[indexPath.section].title ?? "")
            return sectionHeader
        }
        return UICollectionReusableView()
    }
}
