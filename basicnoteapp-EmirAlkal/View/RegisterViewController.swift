//
//  ViewController.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 27.06.2022.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak private var stackView: UIStackView!
    @IBOutlet weak private var signUpButton: UIButton!
    @IBOutlet weak var signUpTopConstraint: NSLayoutConstraint!
        
    var fullNameTextField = CustomTextField(title: "Full Name", errorMessage: "Invalid Full Name") { str in
        if str.isEmpty || str.count > 255 {
            return false
        }
        return true
    }
    
    var emailTextField = CustomTextField(title: "Email Address", errorMessage: "Invalid Mail") { str in
        if str.isEmpty {
            return false
        }
        
        let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let range = NSRange(location: 0, length: str.utf16.count)
        if regex?.firstMatch(in: str, options: [], range: range) == nil {
            return false
        }
        return true
    }
    
    var passwordTextField = CustomTextField(title: "Password", errorMessage: "Invalid password") { str in
        if str.isEmpty || str.count < 6 || str.count > 255 {
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.mainTextField.isSecureTextEntry = true
        configureStackView()
        self.addDoneButtonOnKeyboard()
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(catchChange), userInfo: nil, repeats: true)
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    @objc
    func catchChange() {
        if fullNameTextField.isOk && emailTextField.isOk && passwordTextField.isOk {
            changeButtonStateToActive()
        } else {
            changeButtonStateToPassive()
        }
    }
    
    func changeButtonStateToActive() {
        signUpButton.isEnabled = true
        signUpButton.backgroundColor = .init(red: 139 / 255, green: 140 / 255, blue: 1, alpha: 1)
        signUpButton.titleLabel?.textColor = .white
    }
    
    func changeButtonStateToPassive() {
        signUpButton.isEnabled = false
        signUpButton.backgroundColor = .init(red: 220 / 255, green: 220 / 255, blue: 1, alpha: 1)
        signUpButton.setTitleColor(.init(red: 139 / 140, green: 140 / 140, blue: 1, alpha: 1), for: .normal)
    }
    
    func configureStackView() {
        stackView.addArrangedSubview(fullNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.spacing = 24
        stackView.distribution = .fillEqually
    }
    
    @IBAction private func signUpButtonPressed(_ sender: UIButton) {
        let networkManager = NetworkManager(url: URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/auth/register")!)

        networkManager.registerRequest(with: .init(full_name: fullNameTextField.mainTextField.text!,
                                                   email: emailTextField.mainTextField.text!,
                                                   password: passwordTextField.mainTextField.text!))
    }
}
