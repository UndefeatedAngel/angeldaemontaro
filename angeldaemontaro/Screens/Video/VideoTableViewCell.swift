//
//  VideoTableViewCell.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 7.05.23.
//

import UIKit
import YoutubePlayerView

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var videoView: YoutubePlayerView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    func loadVideo(_ link: String) {
        loadingView.isHidden = false
        let playerVars: [String: Any] = [
            "autoplay": 0,
            "controls": 1,
            "disablekb": 1,
            "enablejsapi": 1,
            "fs": 0,
            "loop": 0,
            "modestbranding": 1,
            "playsinline": 0,
            "rel": 0,
            "showinfo": 0
        ]
        videoView.delegate = self
        videoView.loadWithVideoId(link, with: playerVars)
    }
}

extension VideoTableViewCell: YoutubePlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YoutubePlayerView) {
        print("Ready")
        loadingView.isHidden = true
    }

    func playerView(_ playerView: YoutubePlayerView, didChangedToState state: YoutubePlayerState) {
        print("Changed to state: \(state)")
    }

    func playerView(_ playerView: YoutubePlayerView, didChangeToQuality quality: YoutubePlaybackQuality) {
        print("Changed to quality: \(quality)")
    }

    func playerView(_ playerView: YoutubePlayerView, receivedError error: Error) {
        print("Error: \(error)")
    }

    func playerView(_ playerView: YoutubePlayerView, didPlayTime time: Float) {
        print("Play time: \(time)")
    }
    
    func playerViewPreferredBackgroundColor(_ playerView: YoutubePlayerView) -> UIColor {
        return .black
    }
}
