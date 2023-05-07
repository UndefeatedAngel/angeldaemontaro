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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = R.cardsOfDayMenu
        
        setupGestureTabBar()
        setupCard()
        updateTheme()
    }
    
    private func setupCard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(cardImageViewClick))
        cardImageView.addGestureRecognizer(tap)
    }
    
    @IBAction func highPriecessClick(_ sender: Any) {
        let controller = StoryboardScene.HighPriestess.highPriestessSB.instantiate()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    @IBAction func profileClick(_ sender: Any) {
        
    }
    
    @objc
    private func cardImageViewClick(sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: StoryboardSegue.CardOfDay.cardSegue.rawValue, sender: self)
    }
    
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
}
