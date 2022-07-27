//
//  LoginVC.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 20.07.2022.
//

import UIKit

class LoginVC: UIViewController {

    // MARK: - Properties
    // swiftlint: disable all
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTopConstraint: NSLayoutConstraint!
    // swiftlint: enable all
    
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
        loginButton.tintColor = .white
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor(named: "purple")
    }
    
    func changeButtonStateToPassive() {
        loginButton.isEnabled = false
        loginButton.backgroundColor = UIColor(named: "pink")
    }
    
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        guard let url = URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/auth/login") else { return }
        let networkManager = NetworkManager(url: url)
        
        guard let emailText = emailTextField.mainTextField.text,
              let passwordText = passwordTextField.mainTextField.text
        else { return }
        
        networkManager.loginRequest(with: .init(email: emailText, password: passwordText)) { str in
            let alertController = UIAlertController(title: "Error", message: str, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true)
        } onSuccess: { token in
            currentToken = token.access_token
            self.performSegue(withIdentifier: "loginToNotes", sender: nil)
        }
    }
}
