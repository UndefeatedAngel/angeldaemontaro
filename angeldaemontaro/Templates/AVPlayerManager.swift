//
//  AVPlayer.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 28.04.23.
//

import Foundation
import AVFoundation

class AVPlayerManager {
    public static var avPlayer: AVPlayer?
    public static var audioPlayer: AVAudioPlayer?
    
    public static func playVideo() {
        avPlayer?.isMuted = !Settings.isSounds
        avPlayer?.play()
    }
    
    public static func playAudio() {
        audioPlayer?.volume = Settings.isSounds ? 1 : 0
        audioPlayer?.play()
    }
    
}
