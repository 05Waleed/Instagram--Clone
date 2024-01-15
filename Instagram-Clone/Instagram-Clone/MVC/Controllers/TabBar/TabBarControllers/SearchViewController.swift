//
//  SearchViewController.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties
    
    var dataFetcher = DataFetcher()
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    // MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register XIBs and setup collection view
        registerXIBs()
        setupSearchCollectionView()
        
        // Hide the navigation bar
        navigationController?.navigationBar.isHidden = true
        
        // Fetch data for the search feed
        dataFetcher.fetchDataForSearchFeed(view: view, collectionView: searchCollectionView)
    }

    // MARK: - Private Methods
    
    private func registerXIBs() {
        // Register XIB for collection view cell
        searchCollectionView?.register(UINib(nibName: "SearchCollectionViewCellForImages", bundle: nil), forCellWithReuseIdentifier: "SearchCollectionViewCellForImages")
    }
    
    private func setupSearchCollectionView() {
        // Set up collection view delegate, data source, and background color
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.backgroundColor = .clear
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Number of items in the collection view
        return dataFetcher.searchFeed?.imagesCollection.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure and return the cell for images
        return cellForImages(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set the size for each item in the collection view
        return CGSize(width: 128, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Set the minimum line spacing between rows
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Set the minimum interitem spacing between items in the same row
        return 0
    }
    
    private func cellForImages(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure and return the cell for images
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCellForImages", for: indexPath) as! SearchCollectionViewCell
        let searchData = dataFetcher.searchFeed?.imagesCollection[indexPath.row]
        cell.loadFeedImage(from: searchData!)
        return cell
    }
}
