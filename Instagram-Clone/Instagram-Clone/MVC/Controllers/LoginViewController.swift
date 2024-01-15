//
//  AnotherAccountViewController.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var emailFieldUIManager: TextFieldUIManager!
    private var passwordFieldUIManager: TextFieldUIManager!

    @IBOutlet weak var passwordFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var emailFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var passwordFieldLbl: UILabel!
    @IBOutlet weak var emailFieldLbl: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    // MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        setupUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {}
    
    @IBAction func createNewAccountBttnTap(_ sender: Any) {
        // Instantiate the CreateNewAccountViewController from the storyboard
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateNewAccountViewController") as! CreateNewAccountViewController
        // Customize the appearance of the back button in the navigation bar
        editNavBackButton()
        // Push the CreateNewAccountViewController onto the navigation stack
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBttnTap(_ sender: Any) {
        navigateToTabbar()
    }
    
    @IBAction func existingProfileBttntap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ProfileOptionsViewController") as! ExistingProfileViewController
        editNavBackButton()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        DispatchQueue.main.async { [self] in
            emailFieldLbl.text = ""
            passwordFieldLbl.text = ""
            emailFieldHeight.constant = 32 + 19
            passwordFieldHeight.constant = 32 + 19
            updateFields()
        }
    }
    
    private func editNavBackButton() {
        // Customize the appearance of the back button in the navigation bar
        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.tintColor = .label
        navigationItem.backBarButtonItem = backItem
    }
    
    func navigateToTabbar() {
       // Navigate to the main tab bar controller
       guard let tabBarVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BaseTabBarViewController") as? UITabBarController else {
           print("Unable to instantiate UITabBarController from storyboard.")
           return
       }
       tabBarVC.selectedIndex = 0
       
       if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let window = windowScene.windows.first {
           window.rootViewController = tabBarVC
           window.makeKeyAndVisible()
       } else {
           print("Unable to find window scene or window.")
       }
   }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    private func updateFields() {
        emailFieldUIManager = TextFieldUIManager(textField: emailField, heightConstraint: emailFieldHeight, label: emailFieldLbl, defaultLabelText: "Username, email address, or mobile number", textFieldPlaceholder: "Email")
        passwordFieldUIManager = TextFieldUIManager(textField: passwordField, heightConstraint: passwordFieldHeight, label: passwordFieldLbl, defaultLabelText: "Password", textFieldPlaceholder: "Password")
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        emailFieldUIManager.updateUI(isActive: textField == emailField)
        passwordFieldUIManager.updateUI(isActive: textField == passwordField)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        emailFieldUIManager.updateUI(isActive: false)
        passwordFieldUIManager.updateUI(isActive: false)
    }
}
