//
//  ProfileTableViewCell.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 11.01.2024.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    var dataFetcher = DataFetcher()
    
    // MARK: - Outlets
    
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var followingCountBttn: UIButton!
    @IBOutlet weak var followersCountBttn: UIButton!
    @IBOutlet weak var postsCountBttn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var highlightsCollectionView: UICollectionView!
    @IBOutlet weak var profileFeedCollectionView: UICollectionView!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register XIBs, setup collection views, UI, and fetch data during initialization
        registerXIBs()
        setupCollectionViews()
        setupUI()
        getData()
    }
    
    // MARK: - Actions
    
    @IBAction func userPostsTapButton(_ sender: Any) {
        // Scroll to the first item in the profile feed collection view (User Posts)
        let indexPath = IndexPath(item: 0, section: 0)
        profileFeedCollectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func reelsTapButton(_ sender: Any) {
        // Scroll to the second item in the profile feed collection view (User Reels)
        let indexPath = IndexPath(item: 1, section: 0)
        profileFeedCollectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func taggedTapButton(_ sender: Any) {
        // Scroll to the third item in the profile feed collection view (User Tagged Posts)
        let indexPath = IndexPath(item: 2, section: 0)
        profileFeedCollectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        // Set up initial configurations for UI elements
        profileImage?.layer.cornerRadius = 48
    }
    
    private func getData() {
        // Fetch profile data and load into the collection views
        dataFetcher.fetchDataForProfileFeed(view: contentView, collectionView: highlightsCollectionView, tableView: UITableView())
    }
    
    private func setupCollectionViews() {
        // Set up collection view delegates, data sources, and other configurations
        highlightsCollectionView?.delegate = self
        highlightsCollectionView?.dataSource = self
        highlightsCollectionView?.showsVerticalScrollIndicator = false
        highlightsCollectionView?.showsHorizontalScrollIndicator = false
        highlightsCollectionView?.backgroundColor = .clear
        
        profileFeedCollectionView?.delegate = self
        profileFeedCollectionView?.dataSource = self
        profileFeedCollectionView?.isPagingEnabled = true
        profileFeedCollectionView?.showsVerticalScrollIndicator = false
        profileFeedCollectionView?.showsHorizontalScrollIndicator = false
        profileFeedCollectionView?.backgroundColor = .clear
    }
    
    private func registerXIBs() {
        // Register XIBs for collection views
        highlightsCollectionView?.register(UINib(nibName: "HighlightsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HighlightsCollectionViewCell")
        profileFeedCollectionView?.register(UINib(nibName: "UserPosts", bundle: nil), forCellWithReuseIdentifier: "UserPosts")
        profileFeedCollectionView?.register(UINib(nibName: "UserReels", bundle: nil), forCellWithReuseIdentifier: "UserReels")
        profileFeedCollectionView?.register(UINib(nibName: "UserTaggedPosts", bundle: nil), forCellWithReuseIdentifier: "UserTaggedPosts")
    }
    
    // MARK: - Public Methods
    
    func configure(with profileData: ProfileData) {
        // Configure cell with data from ProfileData
        userNameLbl?.text = profileData.user.username
        bioLbl?.text = profileData.user.bio
        postsCountBttn?.configureButton(title: "\(profileData.user.numberOfPosts)", font: UIFont.systemFont(ofSize: 17), weight: .semibold)
        followersCountBttn?.configureButton(title: "\(profileData.user.followers)", font: UIFont.systemFont(ofSize: 17), weight: .semibold)
        followingCountBttn?.configureButton(title: "\(profileData.user.following)", font: UIFont.systemFont(ofSize: 17), weight: .semibold)
    }
    
    func loadProfileImage(from url: String) {
        // Load profile image into the UIImageView from the provided URL
        profileImage?.loadImage(from: url)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension ProfileTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of items based on the type of collection view
        switch collectionView {
        case self.highlightsCollectionView:
            return (dataFetcher.profileFeed?.highlights.count ?? 0) + 1
        case self.profileFeedCollectionView:
            return 3
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Return the appropriate cell based on the type of collection view
        switch collectionView {
        case self.highlightsCollectionView:
            return cellForHighlightsCollectionView(collectionView, cellForItemAt: indexPath)
        case self.profileFeedCollectionView:
            return cellForProfileFeedCollectionView(collectionView, cellForItemAt: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the size of the item based on the type of collection view
        switch collectionView {
        case self.highlightsCollectionView:
            return CGSize(width: 90, height: 102)
        case self.profileFeedCollectionView:
            return CGSize(width: profileFeedCollectionView.bounds.width, height: profileFeedCollectionView.bounds.height)
        default:
            return CGSize()
        }
    }
    
    // Additional private methods for configuring cells in each collection view
    
    private func cellForHighlightsCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HighlightsCollectionViewCell", for: indexPath) as! HighlightsCollectionViewCell
        
        // Configure cell content based on the type of item in the collection view
        switch indexPath.row {
        case 0:
            cell.configureAtIndex0()
        default:
            if let highlights = dataFetcher.profileFeed?.highlights[indexPath.row - 1] {
                cell.configure(with: highlights)
                cell.loadProfileImage(from: highlights.image)
            } else {
                print("Invalid highlights")
            }
        }
        
        return cell
    }
    
    private func cellForProfileFeedCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Return the appropriate cell for each type of profile feed item
        switch indexPath.row {
        case 0:
            return cellForUserPosts(collectionView, cellForItemAt: indexPath)
        case 1:
            return cellForUserReels(collectionView, cellForItemAt: indexPath)
        case 2:
            return cellForUserTaggedPosts(collectionView, cellForItemAt: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    private func cellForUserPosts(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPosts", for: indexPath) as! ProfileFeedCollectionView
        return cell
    }
    
    private func cellForUserReels(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserReels", for: indexPath) as! ProfileFeedCollectionView
        return cell
    }
    
    private func cellForUserTaggedPosts(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserTaggedPosts", for: indexPath) as! ProfileFeedCollectionView
        return cell
    }
}
