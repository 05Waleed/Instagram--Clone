//
//  DataFetcher.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 13.01.2024.
//

import UIKit

class DataFetcher {
    
    // MARK: - Data Properties
    
    var homeFeed: HomeData?
    var searchFeed: SearchData?
    var reelsFeed: ReelsData?
    var profileFeed: ProfileData?

    // MARK: - Fetch Data for Home Feed
    
    /// Fetches data for the home feed from the specified URL.
    ///
    /// - Parameters:
    ///   - view: The view to show the loading indicator on.
    ///   - collectionView: The collection view to reload after data is fetched.
    ///   - tableView: The table view to reload after data is fetched.
    func fetchDataForHomeFeed(view: UIView?, collectionView: UICollectionView?, tableView: UITableView?) {
        // Show loading indicator
        LoadingIndicator.show(on: view ?? UIView())

        Networking.fetchData(from: APIs.homeFeedURL, loadingIndicator: { isLoading in
            if !isLoading {
                // Hide loading indicator
                print("Data loaded!")
                LoadingIndicator.hide()
            }
        }) { (homeFeed: HomeData) in
            self.homeFeed = homeFeed
            DispatchQueue.main.async {
                tableView?.reloadData()
                collectionView?.reloadData()
            }
        }
    }
    
    // MARK: - Fetch Data for Search Feed
    
    /// Fetches data for the search feed from the specified URL.
    ///
    /// - Parameters:
    ///   - view: The view to show the loading indicator on.
    ///   - collectionView: The collection view to reload after data is fetched.
    func fetchDataForSearchFeed(view: UIView, collectionView: UICollectionView) {
        // Show loading indicator
        LoadingIndicator.show(on: view)

        Networking.fetchData(from: APIs.searchFeedURL, loadingIndicator: { isLoading in
            if !isLoading {
                // Hide loading indicator
                print("Data loaded!")
                LoadingIndicator.hide()
            }
        }) { (searchFeed: SearchData) in
            self.searchFeed = searchFeed
            DispatchQueue.main.async {
                collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Fetch Data for Reels Feed
    
    /// Fetches data for the reels feed from the specified URL.
    ///
    /// - Parameters:
    ///   - view: The view to show the loading indicator on.
    ///   - tableView: The table view to reload after data is fetched.
    func fetchDataForReelsFeed(view: UIView, tableView: UITableView) {
        // Show loading indicator
        LoadingIndicator.show(on: view)

        Networking.fetchData(from: APIs.reelsURL, loadingIndicator: { isLoading in
            if !isLoading {
                // Hide loading indicator
                print("Data loaded!")
                LoadingIndicator.hide()
            }
        }) { (reelsFeed: ReelsData) in
            self.reelsFeed = reelsFeed
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Fetch Data for Profile Feed
    
    /// Fetches data for the profile feed from the specified URL.
    ///
    /// - Parameters:
    ///   - view: The view to show the loading indicator on.
    ///   - collectionView: The collection view to reload after data is fetched.
    ///   - tableView: The table view to reload after data is fetched.
    func fetchDataForProfileFeed(view: UIView?, collectionView: UICollectionView?, tableView: UITableView?) {
        // Show loading indicator
        LoadingIndicator.show(on: view ?? UIView())

        Networking.fetchData(from: APIs.profileFeedURL, loadingIndicator: { isLoading in
            if !isLoading {
                // Hide loading indicator
                print("Data loaded!")
                LoadingIndicator.hide()
            }
        }) { (profileFeed: ProfileData) in
            self.profileFeed = profileFeed
            DispatchQueue.main.async {
                tableView?.reloadData()
                collectionView?.reloadData()
            }
        }
    }
}
