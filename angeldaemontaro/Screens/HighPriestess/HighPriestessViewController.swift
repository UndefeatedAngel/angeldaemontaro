//
//  HighPriestessViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.04.23.
//

import UIKit
import AVKit
import AVFoundation

class HighPriestessViewController: UIViewController {
    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var videoActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var buyConsultation: UIButton!
    @IBOutlet weak var openSite: UIButton!
    @IBOutlet weak var social1: UIButton!
    @IBOutlet weak var social2: UIButton!
    @IBOutlet weak var social3: UIButton!
    @IBOutlet weak var social4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavTitle(text: "Жрица")
        setupVideo()
        setupNavBackButton()
    }
    
    private func setupVideo() {
        videoActivityIndicator.startAnimating()
        if let player = attachVideo(name: "promo", extention: "MOV", view: videoPlayerView) {
            player.isMuted = false
            player.volume = 1.0
            videoActivityIndicator.stopAnimating()
        }
    }
    
}
