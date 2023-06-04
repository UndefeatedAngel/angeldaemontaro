//
//  AVPlayer.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 28.04.23.
//

import Foundation
import AVFoundation
import UIKit

class AVPlayerManager {
    //source/player
    public static var avPlayer: AVPlayer?
    //source/player
    public static var audioPlayer: AVAudioPlayer?
    //source/player
    public static var speakUtterance: AVSpeechUtterance?
    //player
    public static var speakPlayer = AVSpeechSynthesizer()
    
    public static func playVideo() {
        if Settings.language.elementsEqual("ru") {
            avPlayer?.isMuted = !Settings.isSounds
        } else {
            avPlayer?.isMuted = true
        }
        
        avPlayer?.play()
    }
    
    public static func playAudio() {
        if Settings.language.elementsEqual("ru") {
            audioPlayer?.volume = Settings.isSounds ? 1 : 0
        } else {
            audioPlayer?.volume = 0
        }
        audioPlayer?.play()
    }
    
    public static func playSpeak(text: String) {
        if Settings.language == "ru" { return }
        
        speakUtterance = AVSpeechUtterance(string: text)
        speakUtterance?.voice = AVSpeechSynthesisVoice(language: "en-AU")
        speakUtterance?.volume = Settings.isSounds ? 1 : 0
        speakUtterance?.rate = 0.5
        speakUtterance?.pitchMultiplier = 1
        speakPlayer.speak(speakUtterance ?? AVSpeechUtterance(string: text))
    }
    
    public static func stopSpeak() {
        speakPlayer.stopSpeaking(at: AVSpeechBoundary.word)
    }
    
    public static func pauseSpeak() {
        speakPlayer.pauseSpeaking(at: AVSpeechBoundary.word)
    }
    
    public static func isSoundUpdate() {
        if Settings.language.elementsEqual("ru") {
            avPlayer?.isMuted = !Settings.isSounds
            audioPlayer?.volume = Settings.isSounds ? 1 : 0
            speakUtterance?.volume = 0
        } else {
            avPlayer?.isMuted = true
            audioPlayer?.volume = 0
        }
    }
}
