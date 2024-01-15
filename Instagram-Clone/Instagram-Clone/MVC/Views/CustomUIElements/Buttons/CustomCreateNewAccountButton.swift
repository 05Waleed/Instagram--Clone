//
//  CustomCreateNewAccountButton.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class CustomCreateNewAccountButton: UIButton {
    

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    // MARK: - Private Methods
    
    private func setupButton() {
        let customColour = UIColor(red: 55.0/255.0, green: 151.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        
        // Configure button appearance
        backgroundColor = UIColor.clear
        setTitleColor(customColour, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        layer.borderWidth = 1
        layer.borderColor = customColour.cgColor
        layer.cornerRadius = 20
        clipsToBounds = true
    }
}
