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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureTabBar()
    }
    
    @IBAction func highPriecessClick(_ sender: Any) {
        let controller = StoryboardScene.HighPriestess.highPriestessSB.instantiate()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    @IBAction func profileClick(_ sender: Any) {
        
    }
}
