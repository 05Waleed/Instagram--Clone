//
//  ViewController.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class ExistingProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var metaLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var metaImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logInAnotherAccountBttn: UIButton!
    
    // MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
    }
    
    // MARK: - IBActions
    
    @IBAction func logInBttnTap(_ sender: Any) {
       let vc = LoginViewController()
        vc.navigateToTabbar()
    }
    
    @IBAction func createNewAccountBttnTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateNewAccountViewController") as! CreateNewAccountViewController
        editNavBackButton()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupUIElements() {
        // Set up UI elements when the view is loaded
        setupBttnsUI(button: logInAnotherAccountBttn, colour: UIColor.systemGray3)
        roundImage(image: profileImage)
    }
    
    private func setupBttnsUI(button: UIButton, colour: UIColor) {
        // Set up common style for buttons
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = colour.cgColor
    }
    
    private func roundImage(image: UIImageView) {
        // Make the profile image circular with a border
        image.layer.cornerRadius = image.frame.size.height / 2
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
    }
    
    private func editNavBackButton() {
        // Customize the appearance of the back button in the navigation bar
        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.tintColor = .label
        navigationItem.backBarButtonItem = backItem
    }
}
