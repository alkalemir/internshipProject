//
//  ViewController.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 27.06.2022.
//

import UIKit

class RegisterVC: UIViewController {

    // MARK: - Properties
    
    // swiftlint: disable all
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak private var signUpButton: UIButton!
    @IBOutlet weak var signUpTopConstraint: NSLayoutConstraint!
    // swiftlint: enable all

    var fullNameTextField = TextField(title: "Full Name", errorMessage: "Invalid Full Name", closure: Validate.fullNameTextField)
    var emailTextField = TextField(title: "Email Address", errorMessage: "Invalid Mail", closure: Validate.emailTextField)
    var passwordTextField = TextField(title: "Password", errorMessage: "Invalid password", closure: Validate.passwordTextField)
    
    // MARK: - Constructors
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        configureNotificationCenter()
        configureTextFields()
        configureGesture()
    }
    
    // MARK: - Functions
    
    func changeButtonStateToActive() {
        signUpButton.tintColor = .white
        signUpButton.isEnabled = true
        signUpButton.backgroundColor = UIColor(named: "purple")
    }
    
    func changeButtonStateToPassive() {
        signUpButton.isEnabled = false
        signUpButton.backgroundColor = UIColor(named: "pink")
    }
    
    @IBAction private func signUpButtonPressed(_ sender: UIButton) {
        guard let url = URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/auth/register") else { return }
        let networkManager = NetworkManager(url: url)
        
        guard let fullNameText = fullNameTextField.mainTextField.text,
              let emailText = emailTextField.mainTextField.text,
              let passwordText = passwordTextField.mainTextField.text
        else { return }
        
        networkManager.registerRequest(with: .init(fullName: fullNameText,
                                                   email: emailText,
                                                   password: passwordText)) { str in
            let alertController = UIAlertController(title: "Error", message: str, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true)
        }
    }
}
