//
//  CreateNewAccountViewController.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//
import UIKit

class CreateNewAccountViewController: UIViewController {
    
    private var firstNameFieldUIManager: TextFieldUIManager!
    private var lastNameFieldUIManager: TextFieldUIManager!
    private var emailFieldUIManager: TextFieldUIManager!
    private var passwordFieldUIManager: TextFieldUIManager!
    
    @IBOutlet weak var firstNameFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var lastNameFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var firstNameFieldLbl: UILabel!
    @IBOutlet weak var lastNameFieldLbl: UILabel!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var passwordFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var emailFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var passwordFieldLbl: UILabel!
    @IBOutlet weak var emailFieldLbl: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        setupUI()
    }
    
    @IBAction func signupBttnTap(_ sender: Any) {
        let vc = LoginViewController()
        vc.navigateToTabbar()
    }
    
    private func setupUI() {
        DispatchQueue.main.async { [self] in
            firstNameFieldLbl.text = ""
            lastNameFieldLbl.text = ""
            firstNameFieldHeight.constant = 32 + 19
            lastNameFieldHeight.constant = 32 + 19
            emailFieldLbl.text = ""
            passwordFieldLbl.text = ""
            emailFieldHeight.constant = 32 + 19
            passwordFieldHeight.constant = 32 + 19
            updateFields()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension CreateNewAccountViewController: UITextFieldDelegate {
    private func updateFields() {
        firstNameFieldUIManager = TextFieldUIManager(textField: firstNameField, heightConstraint: firstNameFieldHeight, label: firstNameFieldLbl, defaultLabelText: "First name", textFieldPlaceholder: "First name")
        
        lastNameFieldUIManager = TextFieldUIManager(textField: lastNameField, heightConstraint: lastNameFieldHeight, label: lastNameFieldLbl, defaultLabelText: "Last name", textFieldPlaceholder: "Last name")
        
        emailFieldUIManager = TextFieldUIManager(textField: emailField, heightConstraint: emailFieldHeight, label: emailFieldLbl, defaultLabelText: "Username, email address, or mobile number", textFieldPlaceholder: "Email")
        passwordFieldUIManager = TextFieldUIManager(textField: passwordField, heightConstraint: passwordFieldHeight, label: passwordFieldLbl, defaultLabelText: "Password", textFieldPlaceholder: "password")
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        firstNameFieldUIManager.updateUI(isActive: textField == firstNameField)
        lastNameFieldUIManager.updateUI(isActive: textField == lastNameField)
        emailFieldUIManager.updateUI(isActive: textField == emailField)
        passwordFieldUIManager.updateUI(isActive: textField == passwordField)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        firstNameFieldUIManager.updateUI(isActive: false)
        lastNameFieldUIManager.updateUI(isActive: false)
        emailFieldUIManager.updateUI(isActive: false)
        passwordFieldUIManager.updateUI(isActive: false)
    }
}
