//
//  FeildsManager.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 15.01.2024.
//

import UIKit

class TextFieldUIManager {
    private let textField: UITextField
    private let heightConstraint: NSLayoutConstraint
    private let label: UILabel
    private let defaultLabelText: String
    private let textFieldPlaceholder: String
    
    init(textField: UITextField, heightConstraint: NSLayoutConstraint, label: UILabel, defaultLabelText: String, textFieldPlaceholder: String) {
        self.textField = textField
        self.heightConstraint = heightConstraint
        self.label = label
        self.defaultLabelText = defaultLabelText
        self.textFieldPlaceholder = textFieldPlaceholder
    }
    
    func updateUI(isActive: Bool) {
        let targetHeight = isActive ? 32 : 51
        UIView.animate(withDuration: 0.3) {
            self.heightConstraint.constant = CGFloat(targetHeight)
            self.label.text = isActive ? self.defaultLabelText : ""
            self.textField.placeholder =  isActive ? "" : self.textFieldPlaceholder
            self.textField.superview?.layoutIfNeeded()
        }
    }
}
