//
//  ProfileViewController.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    var dataFetcher = DataFetcher()
    
    @IBOutlet weak var profileTableView: UITableView!
    
    // MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register XIBs, setup profile table view, and configure navigation bar button
        registerXIBs()
        setupProfileTableView()
        setupNavigationBarButton()
        
        // Fetch data for the profile feed
        dataFetcher.fetchDataForProfileFeed(view: UIView(), collectionView: UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout()), tableView: profileTableView)
    }
    
    // MARK: - Private Methods
    
    private func setupProfileTableView() {
        // Set up initial configurations for the profile table view
        profileTableView.separatorStyle = .none
    }
    
    private func registerXIBs() {
        // Register XIB for table view cell
        profileTableView?.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    private func setupNavigationBarButton() {
        // Configure and set up the navigation bar button
        let action = UIAction(title: "waleed_1234") { _ in
            print("Button tapped!")
        }
        let navigationLeadingButton = UIButton(type: .custom, primaryAction: action)
        navigationLeadingButton.setImage(UIImage(systemName: "lock"), for: .normal)
        navigationLeadingButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        navigationLeadingButton.tintColor = .label
        navigationLeadingButton.setTitleColor(.label, for: .normal)
        let leadingButtonItem = UIBarButtonItem(customView: navigationLeadingButton)
        navigationItem.leftBarButtonItem = leadingButtonItem
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows in the table view
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure and return the cell for the first row
        return cellForRowOne(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Set the height for each row in the table view
        return tableView.bounds.height
    }
    
    private func cellForRowOne(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure and return the cell for the first row
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
        if let profileData = dataFetcher.profileFeed {
            cell.configure(with: profileData)
            cell.loadProfileImage(from: profileData.user.profileImage)
        } else {
            print("Invalid profileData")
        }
        
        return cell
    }
}
