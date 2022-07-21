//
//  ForgotPasswordVC.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 21.07.2022.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    // swiftlint: disable all
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var forgotButton: UIButton!
    // swiftlint: enable all
    
    var emailTextField = TextField(title: "Email Address", errorMessage: "Invalid Mail", closure: Validate.emailTextField)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        configureTextFields()
        configureNavBarBackButton()
    }
    
    // MARK: - Functions
    func changeButtonStateToActive() {
        forgotButton.tintColor = .white
        forgotButton.isEnabled = true
        forgotButton.backgroundColor = UIColor(named: "purple")
    }
    
    func changeButtonStateToPassive() {
        forgotButton.isEnabled = false
        forgotButton.backgroundColor = UIColor(named: "pink")
    }
}
