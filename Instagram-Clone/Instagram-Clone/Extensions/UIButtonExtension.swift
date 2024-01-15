//
//  UIButtonExtension.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 14.01.2024.
//

import Foundation

import UIKit

extension UIButton {
    func configureButton(title: String, font: UIFont, weight: UIFont.Weight) {
        let buttonFont = UIFont.systemFont(ofSize: 14, weight: weight)
        let buttonAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: buttonFont]
        let buttonTitle = NSAttributedString(string: "\(title)", attributes: buttonAttributes)
        setAttributedTitle(buttonTitle, for: .normal)
    }
}
