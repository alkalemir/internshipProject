//
//  ViewController.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 27.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var stackView: UIStackView!
    
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
    }
    
    func configureStackView() {
        stackView.addArrangedSubview(fullNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.spacing = 24
        stackView.distribution = .fillEqually
    }
}
