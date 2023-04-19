//
//  UIViewController+Video.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 19.04.23.
//

import UIKit
import AVFoundation
import AVKit

extension UIViewController {
    public func attachVideo(name: String, extention: String, view: UIView) -> AVPlayer? {
        guard let path = Bundle.main.path(forResource: name, ofType: extention) else {
            return nil
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        view.layer.addSublayer(playerLayer)
        player.play()
        return player
    }
}
