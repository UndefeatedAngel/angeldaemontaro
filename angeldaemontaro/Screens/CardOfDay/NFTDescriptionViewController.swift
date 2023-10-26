//
//  MapDescriptionViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class NFTDescriptionViewController: UIViewController {
    var json: NFTCardsModel.NFTCardsJson?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var buyButton: UIButton! {
        didSet {
            buyButton.layer.masksToBounds = true
            buyButton.layer.cornerRadius = 10
            buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            buyButton.setTitle(getLocale(key: "cards_button"), for: .normal)
            buyButton.addTarget(
                self,
                action: #selector(onBuyClick),
                for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureTabBar()
        
        guard let json = json else { return }

        let locale = json.locale
        let key = json.description
        let description = self.getLocaleFromTable(tableName: locale, key: key)
        textView.text = getLocale(key: description)
        let keyImage = "\(json.image)NFT"
        imageView.image = keyImage.getImage(controller: self)
        let isDark = traitCollection.userInterfaceStyle == .dark
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = isDark ? UIColor.white.cgColor : UIColor.black.cgColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        
        updateTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logScreen(screenName: "NFTDetail", screenClass: String(describing: self))
    }
    
    @objc
    func onBuyClick() {
        
    }
    
    // MARK: Update Theme
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorWhite,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold)
        ]
        
        textView.textColor = colorWhite
        
        buyButton.tintColor = colorDark
        buyButton.backgroundColor = colorWhite
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}
