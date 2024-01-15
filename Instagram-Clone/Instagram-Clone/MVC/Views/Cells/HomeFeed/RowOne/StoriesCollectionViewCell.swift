//
//  StoriesCollectionViewCell.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var isStorySeenView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        isStorySeenView.layer.cornerRadius = 43
        isStorySeenView.layer.borderWidth = 2.5
        
        storyImage.layer.cornerRadius = 37
        storyImage.layer.borderWidth = 2
        storyImage.layer.borderColor = UIColor.clear.cgColor
    }
    
    func configure(with users: HomeStory) {
        userNameLbl.text = users.name
    }
    
    func isStorySeen(by users: HomeStory) {
        isStorySeenView.layer.borderColor = users.isStoryView ? UIColor.systemGray5.cgColor : UIColor.red.cgColor
    }

    
    func loadImage(from url: String) {
        storyImage.loadImage(from: url)
    }
}
