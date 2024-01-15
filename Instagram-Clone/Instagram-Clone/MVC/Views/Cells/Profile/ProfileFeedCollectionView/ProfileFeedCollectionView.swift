//
//  ProfileFeedCollectionViewView.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 09.01.2024.
//

import UIKit

class ProfileFeedCollectionView: UICollectionViewCell {
    
    // MARK: - Properties
    
    var dataFetcher = DataFetcher()
    
    // MARK: - Outlets
    
    @IBOutlet weak var userPostsCollectionViewCell: UICollectionView!
    @IBOutlet weak var userReelsCollectionViewCell: UICollectionView!
    @IBOutlet weak var userTaggadPostsCollectionViewCell: UICollectionView!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register XIBs and conform to protocols during initialization
        registerXIBs()
        conformProtocols()
        getData()
    }
    
    // MARK: - Private Methods
    
    private func getData() {
        // Fetch data for the profile feed
        dataFetcher.fetchDataForProfileFeed(view: UIView(), collectionView: userPostsCollectionViewCell, tableView: UITableView())
    }
    
    private func conformProtocols() {
        // Set data source and delegate for each collection view
        userPostsCollectionViewCell?.dataSource = self
        userPostsCollectionViewCell?.delegate = self
        
        userReelsCollectionViewCell?.dataSource = self
        userReelsCollectionViewCell?.delegate = self
        
        userTaggadPostsCollectionViewCell?.dataSource = self
        userTaggadPostsCollectionViewCell?.delegate = self
    }
    
    private func registerXIBs() {
        // Register XIBs for each collection view cell type
        userPostsCollectionViewCell?.register(UINib(nibName: "UserPostsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserPostsCollectionViewCell")
        
        userReelsCollectionViewCell?.register(UINib(nibName: "UserReelsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserReelsCollectionViewCell")
        
        userTaggadPostsCollectionViewCell?.register(UINib(nibName: "UserTaggedPostsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserTaggedPostsCollectionViewCell")
    }
}

extension ProfileFeedCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.userPostsCollectionViewCell:
            return dataFetcher.profileFeed?.userPostedImages.count ?? 0
        case self.userReelsCollectionViewCell:
            return 2
        case self.userTaggadPostsCollectionViewCell:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.userPostsCollectionViewCell:
            return cellForUserPosts(collectionView, cellForItemAt: indexPath)
        case self.userReelsCollectionViewCell:
            return cellForUserReels(collectionView, cellForItemAt: indexPath)
        case self.userTaggadPostsCollectionViewCell:
            return cellForUserTaggadPosts(collectionView, cellForItemAt: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    // MARK: - Private Cell Configuration Methods
    
    private func cellForUserPosts(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure and return cell for user posts
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPostsCollectionViewCell", for: indexPath) as! UserPostsCollectionViewCell
        let userPosts = dataFetcher.profileFeed?.userPostedImages[indexPath.row]
        cell.loadProfileImage(from: userPosts!.image)
        return cell
    }
    
    private func cellForUserReels(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure and return cell for user reels
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserReelsCollectionViewCell", for: indexPath) as! UserReelsCollectionViewCell

        // Additional configuration for user reels cell if needed

        return cell
    }
    
    private func cellForUserTaggadPosts(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure and return cell for user tagged posts
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserTaggedPostsCollectionViewCell", for: indexPath) as! UserTaggedPostsCollectionViewCell

        // Additional configuration for user tagged posts cell if needed

        return cell
    }
}
