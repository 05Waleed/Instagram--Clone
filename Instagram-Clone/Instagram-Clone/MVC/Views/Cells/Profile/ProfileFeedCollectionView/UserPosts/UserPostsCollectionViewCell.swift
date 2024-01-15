//
//  UserPostsCollectionViewCell.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 09.01.2024.
//

import UIKit

class UserPostsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var uploadedPosts: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func loadProfileImage(from url: String) {
        uploadedPosts?.loadImage(from: url)
    }
}
