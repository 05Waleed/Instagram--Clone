//
//  WatchReelsViewController.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit
import AVKit
import AVFoundation

// MARK: - WatchReelsViewController

class WatchReelsViewController: UIViewController {
    
    // MARK: - Properties
    
    var dataFetcher = DataFetcher()
    var visibleIndexPath: IndexPath?
    
    @IBOutlet weak var reelsTableView: UITableView!
    
    // MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup reels table view and register XIBs
        setupReelsTableView()
        registerXIBs()
        
        // Fetch data for the reels feed
        dataFetcher.fetchDataForReelsFeed(view: view, tableView: reelsTableView)
    }
    
    // MARK: - Private Methods
    
    /// Registers XIBs for table view cells.
    private func registerXIBs() {
        reelsTableView?.register(UINib(nibName: "ReelsCellView", bundle: nil), forCellReuseIdentifier: "ReelsCellView")
    }
    
    /// Configures initial settings for the reels table view.
    private func setupReelsTableView() {
        reelsTableView.backgroundColor = .clear
        reelsTableView?.isPagingEnabled = true
        reelsTableView?.separatorStyle = .none
        reelsTableView.showsVerticalScrollIndicator = false
        reelsTableView.dataSource = self
        reelsTableView.delegate = self
    }
    
    // MARK: - Video Handling
    
    /// Starts playing the video for the given cell at the specified index path.
    private func playVideoForCell(at indexPath: IndexPath) {
        guard let cell = reelsTableView.cellForRow(at: indexPath) as? ReelsTableViewCell else {
            return
        }
        cell.play()
        visibleIndexPath = indexPath
    }
    
    /// Pauses the video for the given cell at the specified index path.
    private func pauseVideoForCell(at indexPath: IndexPath) {
        guard let cell = reelsTableView.cellForRow(at: indexPath) as? ReelsTableViewCell else {
            return
        }
        cell.pause()
    }
    
    /// Handles the scroll view deceleration to control video playback.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPaths = reelsTableView.indexPathsForVisibleRows, let visibleIndexPath = indexPaths.first {
            if visibleIndexPath != self.visibleIndexPath {
                pauseVideoForCell(at: self.visibleIndexPath ?? IndexPath(row: 0, section: 0))
                playVideoForCell(at: visibleIndexPath)
            }
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension WatchReelsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFetcher.reelsFeed?.reelsURL.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReelsCellView", for: indexPath) as! ReelsTableViewCell
        
        if let videoURLString = dataFetcher.reelsFeed?.reelsURL[indexPath.row].videoURL,
           let originalURL = URL(string: videoURLString) {
            var urlComponents = URLComponents(url: originalURL, resolvingAgainstBaseURL: false)
            urlComponents?.scheme = "https"
            
            if let securedURL = urlComponents?.url {
                cell.configure(with: securedURL, at: indexPath)
                playVideoForCell(at: indexPath)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
}
