//
//  HomeFeedViewController.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class HomeFeedViewController: UIViewController {
    
    // MARK: - Properties
    
    var dataFetcher = DataFetcher()
    
    @IBOutlet weak var feedTableView: UITableView!
    
    // MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup table view and register XIBs
        setupFeedTableView()
        registerXIBs()
        
        // Fetch data for the home feed
        dataFetcher.fetchDataForHomeFeed(view: UIView(), collectionView: UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout()), tableView: feedTableView)
    }
        
    // MARK: - Private Methods
    
    private func registerXIBs() {
        // Register XIBs for table view cells
        feedTableView?.register(UINib(nibName: "FeedTableTableViewRowOne", bundle: nil), forCellReuseIdentifier: "FeedTableTableViewRowOne")
        feedTableView?.register(UINib(nibName: "FeedTableTableViewRowTwo", bundle: nil), forCellReuseIdentifier: "FeedTableTableViewRowTwo")
    }
    
    private func setupFeedTableView() {
        // Set up initial configurations for the table view
        feedTableView.separatorStyle = .none
        feedTableView.backgroundColor = .clear
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate

extension HomeFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows in the table view
        return (dataFetcher.homeFeed?.homeFeed.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure cells based on row index
        switch indexPath.row {
        case 0:
            return cellForStoryCollectionView(tableView, at: indexPath)
        default:
            return cellForPostsFeed(tableView, at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Set different row heights for the story collection view and posts feed
        return indexPath.row == 0 ? 135 : 575
    }
    
    private func cellForStoryCollectionView(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        // Configure and return the cell for the story collection view
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableTableViewRowOne") as! FeedTableTableViewCell
        return cell
    }
    
    private func cellForPostsFeed(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        // Configure and return the cell for the posts feed
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableTableViewRowTwo") as! FeedTableTableViewCell
        let homeFeed = dataFetcher.homeFeed?.homeFeed[indexPath.row - 1]
        cell.configure(with: homeFeed!)
        cell.loadFeedImage(from: homeFeed!.feedImage)
        cell.loadProfileImage(from: homeFeed!.profileImage)
        return cell
    }
}
