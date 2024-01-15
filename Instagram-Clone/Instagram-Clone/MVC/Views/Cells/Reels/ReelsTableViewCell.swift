//
//  ReelsTableViewCell.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 07.01.2024.
//

import UIKit
import AVKit
import AVFoundation

// MARK: - ReelsTableViewCell

class ReelsTableViewCell: UITableViewCell {
    
    var currentIndex: IndexPath?
    
    @IBOutlet weak var reelsView: UIView!
    @IBOutlet weak var sharesCountLbl: UILabel!
    @IBOutlet weak var commentsCountLbl: UILabel!
    @IBOutlet weak var likesCountLbl: UILabel!
    @IBOutlet weak var likedByCountLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configure and Setup
    
    /// Configures the cell with video URL and index path.
    func configure(with videoURL: URL, at indexPath: IndexPath) {
        currentIndex = indexPath
        setupPlayer(url: videoURL)
        setupPlayerLayer()
    }
    
    /// Sets up the AVPlayer with the provided video URL.
    func setupPlayer(url: URL) {
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
    }
    
    /// Sets up the AVPlayerLayer for video playback.
    func setupPlayerLayer() {
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill
        playerLayer?.frame = reelsView.bounds
        reelsView.layer.addSublayer(playerLayer!)
    }
    
    
    // MARK: - Playback Control
    
    /// Starts playing the video.
    func play() {
        player?.play()
    }
    
    /// Pauses the video.
    func pause() {
        player?.pause()
    }
}
