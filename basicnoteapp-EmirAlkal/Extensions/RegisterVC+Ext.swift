//
//  RegisterViewController+Ext.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import UIKit

// MARK: - Add keyboard show/hide

extension RegisterVC {
    @objc
    func keyboardWillAppear(_ notification: Notification) {
        signUpTopConstraint.constant = 8
    }

    @objc
    func keyboardWillDisappear() {
        signUpTopConstraint.constant = 96
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Configurations

extension RegisterVC {
    func configureNotificationCenter() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func configureStackView() {
        stackView.addArrangedSubview(fullNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.spacing = 24
        stackView.distribution = .fillEqually
    }
    
    func configureTextFields() {
        passwordTextField.mainTextField.isSecureTextEntry = true
        passwordTextField.mainTextField.addEyeToggle()
        fullNameTextField.mainTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.mainTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.mainTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func configureGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - TextFieldDelegate Functions

extension RegisterVC {
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        
        if fullNameTextField.closure(fullNameTextField.mainTextField.text ?? "") &&
            emailTextField.closure(emailTextField.mainTextField.text ?? "") &&
            passwordTextField.closure(passwordTextField.mainTextField.text ?? "") {
            changeButtonStateToActive()
        } else {
            changeButtonStateToPassive()
        }
    }
}
