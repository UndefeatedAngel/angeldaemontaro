//
//  CardsOfDayViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.04.23.
//

import UIKit
import AVKit

class CardsOfDayScreenViewController: UIViewController {
    let maxCount = 3
    let keySave = "cardofday"
    
    @IBOutlet weak var highPriestessButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var adsText: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var nftCards = NFTCardsModel()
    var numberSection = 0
    var numberRow = 0
    
    let nftSegue = "nftDescriptionSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureTabBar()
        setupCard()
        updateTheme()
        
        setupNavBar()
        
        nftCards.content?.removeAll()
        loadFromServer()

        AdsManager.shared.loadRewarded()
        
        setAdsText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavTitle(text: getLocale(key: "cardsOfDayMenu"))
        collectionView.reloadData()
    }
    
    private func setupCard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(cardImageViewClick))
        cardImageView.addGestureRecognizer(tap)
    }
    
    private func setupNavBar() {
        let highPriecessButton = UIBarButtonItem(
            image: Assets.Images.highPriecess.image,
            style: .plain, target: self, action: #selector(highPriecessClick))
        
        let settingsButton = UIBarButtonItem(
            image: Assets.Images.settings.image,
            style: .plain, target: self, action: #selector(settingsClick))
        
        let profileButton = UIBarButtonItem(
            image: Assets.Images.profileIcon.image,
            style: .plain, target: self, action: #selector(profileClick))
        
        self.navigationItem.leftBarButtonItems = [highPriecessButton]
        self.navigationItem.rightBarButtonItems = [settingsButton, profileButton]
    }
    
    @objc
    func highPriecessClick() {
        let controller = StoryboardScene.HighPriestess.highPriestessSB.instantiate()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    @objc
    func settingsClick() {
        let controller = StoryboardScene.Settings.settingsSB.instantiate()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    @objc
    func profileClick() {
        let controller = StoryboardScene.Profile.profileSB.instantiate()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    @objc
    private func cardImageViewClick(sender: UITapGestureRecognizer) {
        let current = AdsData.getRewardType(type: keySave)
        
        if current < maxCount {
            self.performSegue(withIdentifier: StoryboardSegue.CardOfDay.cardSegue.rawValue, sender: self)
            AdsData.setRewardType(type: keySave, count: current + 1)
            setAdsText()
        } else {
            AdsManager.shared.showReward(self, count: maxCount, key: keySave) { [weak self] in
                self?.setAdsText()
            }
        }
    }
    
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        self.navigationItem.titleView?.backgroundColor = colorDark
        self.navigationItem.titleView?.tintColor = colorWhite
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
    
    func loadFromServer() {
        getFirebaseJson(jsonName: "configNFTCards.json") { [weak self] dataJson in
            guard let self = self else { return }
            do {
                self.nftCards.content = try JSONDecoder().decode([NFTCardsModel.NFTSpreadJson].self, from: dataJson)
                self.collectionView.reloadData()
            } catch {
                self.errorCreateNFTModel()
            }
            
        } error: { [weak self] in
            self?.errorCreateNFTModel()
        }

    }
    
    func errorCreateNFTModel() {
//        nftCards = NFTCardsModel()
//        collectionView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let descruptionController = segue.destination as? NFTDescriptionViewController {
            descruptionController.json = self.nftCards.content?[numberSection].cards[numberRow]
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}

extension CardsOfDayScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return nftCards.content?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nftCards.content?[section].cards.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        numberRow = indexPath.row
        performSegue(withIdentifier: nftSegue, sender: self)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: NFTCollectionViewCell.reuseID,
            for: indexPath) as? NFTCollectionViewCell {
            let isDark = traitCollection.userInterfaceStyle == .dark
            
            cell.contentView.backgroundColor = .clear
            cell.nftImageView?.image = getImageNFT(numberSection: indexPath.section, numberKey: indexPath.row)
            cell.nftImageView?.layer.borderWidth = 2
            cell.nftImageView?.layer.borderColor = isDark ? UIColor.white.cgColor : UIColor.black.cgColor
            cell.nftImageView?.clipsToBounds = true
            cell.nftImageView?.layer.cornerRadius = (cell.nftImageView?.bounds.width ?? 75) / 2
            cell.contentView.clipsToBounds = true
            cell.contentView.layer.cornerRadius = cell.contentView.bounds.width / 2
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func getImage(numberSection: Int, numberKey: Int) -> UIImage? {
        let imageName = nftCards.content?[numberSection].cards[numberKey].image ?? ""
        return imageName.getImageLocale(controller: self)
    }
    
    func getImageNFT(numberSection: Int, numberKey: Int) -> UIImage? {
        let imageName = nftCards.content?[numberSection].cards[numberKey].image ?? ""
        let keyImage = "\(imageName)NFT"
        return keyImage.getImage(controller: self)
    }
    
    func setAdsText() {
        let current = AdsData.getRewardType(type: keySave)
        if maxCount - current < 1 {
            adsText.text = "ADS"
            cardImageView.alpha = 0.5
        } else {
            adsText.text = "\(maxCount - current)"
            cardImageView.alpha = 1
        }
    }
}
