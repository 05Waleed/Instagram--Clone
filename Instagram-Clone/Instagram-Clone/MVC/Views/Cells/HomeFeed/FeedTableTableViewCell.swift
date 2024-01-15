//
//  FeedTableTableViewCell.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class FeedTableTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var dataFetcher = DataFetcher()
    
    @IBOutlet weak var timePostedLbl: UILabel!
    @IBOutlet weak var commentsCountBttn: UIButton!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var likesCountBttn: UIButton!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var storiesCollectionView: UICollectionView!

    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register XIBs, setup UI, and configure collection view
        registerXIBs()
        setupUI()
        setupStoriesCollectionView()
        getData()
    }
    
    // MARK: - Private Methods
    
    private func getData() {
        // Fetch data for the home feed and populate the collection view
        dataFetcher.fetchDataForHomeFeed(view: contentView, collectionView: storiesCollectionView, tableView: UITableView())
    }
    
    private func setupUI() {
        // Set up initial configurations for the UI elements
        profileImage?.layer.cornerRadius = 16
    }
 
    private func registerXIBs() {
        // Register XIB for collection view cell
        storiesCollectionView?.register(UINib(nibName: "StoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoriesCollectionViewCell")
    }
    
    private func setupStoriesCollectionView() {
        // Set up initial configurations for the stories collection view
        storiesCollectionView?.dataSource = self
        storiesCollectionView?.delegate = self
        storiesCollectionView?.showsHorizontalScrollIndicator = false
        storiesCollectionView?.showsVerticalScrollIndicator = false
        storiesCollectionView?.backgroundColor = .clear
    }
    
    // MARK: - Public Methods
    
    func configure(with homeFeed: HomeFeed) {
        // Configure cell with data from the home feed
        captionLbl?.text = homeFeed.feedImageCaption
        profileNameLbl?.text = homeFeed.userProfileName
        locationLbl?.text = "Some where"
        timePostedLbl?.text = homeFeed.timeAgoPosted
        
        likesCountBttn?.configureButton(title: "\(homeFeed.likesCount) likes", font: UIFont.systemFont(ofSize: 13), weight: .medium)
        commentsCountBttn?.configureButton(title: "View all \(homeFeed.commentsCount) comments", font: UIFont.systemFont(ofSize: 13), weight: .semibold)
    }
    
    func loadFeedImage(from url: String) {
        // Load the feed image from the provided URL
        feedImage?.loadImage(from: url)
    }
    
    func loadProfileImage(from url: String) {
        // Load the profile image from the provided URL
        profileImage?.loadImage(from: url)
    }
    
    // MARK: - Helper Method
    
    private func configureButton(title: String, font: UIFont, weight: UIFont.Weight, button: UIButton?) {
        // Configure the appearance of a button with specified title, font, and weight
        let buttonFont = UIFont.systemFont(ofSize: 14, weight: weight)
        let buttonAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: buttonFont]
        let buttonTitle = NSAttributedString(string: "\(title)", attributes: buttonAttributes)
        button?.setAttributedTitle(buttonTitle, for: .normal)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension FeedTableTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Number of items in the stories collection view
        return dataFetcher.homeFeed?.homeStories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure and return the cell for stories
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as! StoriesCollectionViewCell
        let userData = dataFetcher.homeFeed?.homeStories[indexPath.row]
        cell.configure(with: userData!)
        cell.isStorySeen(by: userData!)
        cell.loadImage(from: userData?.image ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set the size for each item in the collection view
        return CGSize(width: 94, height: 108)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Set the minimum line spacing between rows
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Set the minimum interitem spacing between items in the same row
        return 0
    }
}
