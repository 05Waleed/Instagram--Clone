//
//  HighlightsCollectionViewCell.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 09.01.2024.
//

import UIKit

class HighlightsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var highlightsLbl: UILabel!
    @IBOutlet weak var highlightsImage: UIImageView!
    @IBOutlet weak var highLightsImageRing: UIView!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set up UI configurations during initialization
        highLightsImageRing.layer.cornerRadius = 40
        highLightsImageRing.layer.borderWidth = 2
        highLightsImageRing.layer.borderColor = UIColor.systemGray6.cgColor
        
        highlightsImage.layer.cornerRadius = 34
        highlightsImage.layer.borderWidth = 2
        highlightsImage.layer.borderColor = UIColor.clear.cgColor
    }
    
    // MARK: - Public Methods
    
    func configureAtIndex0() {
        // Configure cell for the special case when it's at index 0
        highlightsImage.image = UIImage(systemName: "plus")
        highlightsImage.contentMode = .scaleAspectFit
        highlightsImage.tintColor = .darkGray
        highlightsLbl.text = "New"
    }
    
    func configure(with highlightsData: Highlight) {
        // Configure cell with data from the provided Highlight object
        highlightsLbl?.text = highlightsData.heading
    }
    
    func loadProfileImage(from url: String) {
        // Load an image into the UIImageView from the provided URL
        highlightsImage?.loadImage(from: url)
    }
}
