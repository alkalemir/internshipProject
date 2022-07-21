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
    
    @IBAction private func resetButtonPressed(_ sender: UIButton) {
        guard let textFieldText = emailTextField.mainTextField.text else {
            return
        }
        NetworkManager(url: URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/auth/forgot-password")!)
            .forgotPasswordRequest(email: Forgot(email: textFieldText)) { str in
                let alertController = UIAlertController(title: "Error", message: str, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true)
            } onSuccess: { response in
                let alertController = UIAlertController(title: "Success", message: response.message, preferredStyle: .actionSheet)
                alertController.addAction(UIAlertAction(title: "OK!", style: .default))
                self.present(alertController, animated: true)
            }
    }
}
