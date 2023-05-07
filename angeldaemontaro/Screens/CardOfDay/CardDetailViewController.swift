//
//  CardDetailViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 25.04.23.
//

import UIKit

class CardDetailViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        }
    }
    
    private var isFirst: Bool = false
    
    private let menuCardsDay = CardsDayModel()
    private var numberCardsDay = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCardOfDay()
        
        setupNavBackButton(complete: #selector(backClick))
        setupSoundsNav()
        
        updateTheme()
    }
    
    @objc
    func backClick() {
        self.navigationController?.popViewController(animated: true)
        AVPlayerManager.audioPlayer = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isFirst {
            AVPlayerManager.audioPlayer?.play()
            return
        }
        isFirst = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let self = self else { return }
            self.cardImageView.image = self.getImage(langKey: self.getLangKey(), numberKey: self.numberCardsDay)
            self.animateCardDay { _ in
                self.showDescriptionDay()
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        AVPlayerManager.audioPlayer?.pause()
    }
    
    func setCardOfDay() {
        let keySave = "cardsDayDate"
        let keySaveCurrent = "cardsDayDate_current"
        if let date = UserDefaults.standard.object(forKey: keySave) as? Date {
            let df = DateFormatter()
            df.dateFormat = "dd/MM/yyyy"
            let current = df.string(from: date)
            let now = df.string(from: Date.now)
            if current.elementsEqual(now) {
                if let number = UserDefaults.standard.object(forKey: keySaveCurrent) as? Int {
                    numberCardsDay = number
//                    return
                }
            }
        }
        
        if let count = menuCardsDay.cards?.count {
            numberCardsDay = Int.random(in: 0..<count)
            UserDefaults.standard.set(Date.now, forKey: keySave)
            UserDefaults.standard.set(numberCardsDay, forKey: keySaveCurrent)
            //saveCardOfDay()
        }
    }
    
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        descriptionTextView.textColor = colorWhite
        
        navigationItem.leftBarButtonItems?[0].tintColor = colorWhite
        navigationItem.rightBarButtonItems?[0].tintColor = colorWhite
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}

extension CardDetailViewController {
    func animateCardDay(finished: @escaping (Bool) -> Void) {
        let screenHeight = UIScreen.main.bounds.height / 2
        let originalTransform = cardImageView.transform
        let scaledTransform = originalTransform.scaledBy(x: 1.05, y: 1.05)
        let scaledAndTranslatedTransform =
            scaledTransform.translatedBy(x: 0.0, y: -screenHeight + cardImageView.bounds.height / 2)
        UIView.transition(
            with: cardImageView,
            duration: 1.0,
            options: .transitionFlipFromRight,
            animations: {
                self.cardImageView.transform = scaledAndTranslatedTransform
            },
            completion: finished)
    }
    
    func getImage(langKey: String, numberKey: Int) -> UIImage? {
        let imageName = menuCardsDay.cards?[numberKey].image ?? ""
        return imageName.getImageLocale(controller: self)
    }
    
    func showDescriptionDay() {
        let card = self.menuCardsDay.cards?[self.numberCardsDay]
        guard let card = card else { return }
        
        let locale = card.locale
        let key = card.description
        let description = self.getLocaleFromTable(tableName: locale, key: key)
        self.descriptionTextView.text = description

//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
//            guard let self = self else { return }
//            let countSymbols = description.count
//            self.descriptionTextView.animation(typing: description, duration: Double(countSymbols) * 0.01)
//        }
        
        playSound(name: card.sound)
    }
}
