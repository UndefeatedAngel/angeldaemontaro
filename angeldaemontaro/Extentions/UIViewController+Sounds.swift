//
//  UIViewController+Sounds.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 8.09.22.
//

import Foundation
import UIKit
import AVFoundation

extension UIViewController {
    private static var player: AVAudioPlayer?
    
    func playSound(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "m4a") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            UIViewController.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = UIViewController.player else { return }

            player.play()
            player.volume = 1

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopSound() {
        UIViewController.player?.stop()
    }
    
    func setVolume(volume: Float) {
        UIViewController.player?.volume = volume
    }
}
