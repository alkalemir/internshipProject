//
//  RegisterViewController+Ext.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import UIKit

// MARK: - Add Done Button

extension RegisterViewController {
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        fullNameTextField.mainTextField.inputAccessoryView = doneToolbar
        emailTextField.mainTextField.inputAccessoryView = doneToolbar
        passwordTextField.mainTextField.inputAccessoryView = doneToolbar
    }

    @objc
    func doneButtonAction() {
        fullNameTextField.mainTextField.resignFirstResponder()
        emailTextField.mainTextField.resignFirstResponder()
        passwordTextField.mainTextField.resignFirstResponder()
    }
}

// MARK: - Add keyboard show/hide

extension RegisterViewController {
    @objc
    func keyboardWillAppear(_ notification: Notification) {
       
        if let _: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            signUpTopConstraint.constant = 8
        }
    }

    @objc
    func keyboardWillDisappear() {
        signUpTopConstraint.constant = 96
    }
}
