//
//  CustomLogInButton.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class CustomLoginButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor = UIColor.customLogInButton
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        layer.cornerRadius = 20
        clipsToBounds = true
    }
}

