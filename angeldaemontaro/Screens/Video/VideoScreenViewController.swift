//
//  VideoScreenViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 18.04.23.
//

import UIKit
import AVKit

class VideoScreenViewController: UIViewController {
//    private let link: String = "https://youtu.be/58v_WyZ8EwA"
    private let link: String = "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4"


    @IBOutlet weak var viewForVideo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = R.videoMenu

        setupGestureTabBar()
        
        let videoURL = URL(string: link)
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.viewForVideo.bounds
        self.viewForVideo.layer.addSublayer(playerLayer)
        player.play()
    }
}
