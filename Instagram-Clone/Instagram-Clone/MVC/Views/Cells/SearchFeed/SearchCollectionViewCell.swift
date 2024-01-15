//
//  SearchCollectionViewCell.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 07.01.2024.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageForImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func loadFeedImage(from url: String) {
        imageForImage?.loadImage(from: url)
    }
}
