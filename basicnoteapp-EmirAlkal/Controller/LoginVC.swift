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
}
