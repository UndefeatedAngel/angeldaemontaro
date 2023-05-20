//
//  CardsOfDayViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.04.23.
//

import UIKit

class CardsOfDayScreenViewController: UIViewController {
    @IBOutlet weak var highPriestessButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    let nftCards = NFTCardsModel()
    var numberSection = 0
    var numberRow = 0
    
    let nftSegue = "nftDescriptionSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureTabBar()
        setupCard()
        updateTheme()
        
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavTitle(text: getLocale(key: "cardsOfDayMenu"))
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
        self.performSegue(withIdentifier: StoryboardSegue.CardOfDay.cardSegue.rawValue, sender: self)
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
}
