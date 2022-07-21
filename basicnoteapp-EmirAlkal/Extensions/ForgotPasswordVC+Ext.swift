//
//  ForgotPasswordVC+Ext.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 21.07.2022.
//

import UIKit

// MARK: - TextFieldDelegate Functions

extension ForgotPasswordVC {
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        if emailTextField.closure(emailTextField.mainTextField.text ?? "") {
            changeButtonStateToActive()
        } else {
            changeButtonStateToPassive()
        }
    }
}

// MARK: - Configurations

extension ForgotPasswordVC {

    func configureStackView() {
        stackView.addArrangedSubview(emailTextField)
        stackView.spacing = 24
        stackView.distribution = .fillEqually
    }
    
    func configureTextFields() {
        emailTextField.mainTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func configureNavBarBackButton() {
        navigationController?.navigationBar.backIndicatorImage = .init(named: "Path")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = .init(named: "Path")
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
    }

}
