//
//  ViewController.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 27.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var stackView: UIStackView!
    
    var fullNameTextField = CustomTextField(title: "Full Name", errorMessage: "Invalid Full Name") { _ in
        return false
    }
    
    var emailTextField = CustomTextField(title: "Email Address", errorMessage: "Invalid Mail") { _ in
        return false
    }
    
    var passwordTextField = CustomTextField(title: "Password", errorMessage: "Invalid password") { _ in
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
