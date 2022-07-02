//
//  RegisterViewController+Ext.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import UIKit

// MARK: - Add keyboard show/hide

extension RegisterViewController {
    @objc
    func keyboardWillAppear(_ notification: Notification) {
        signUpTopConstraint.constant = 8
    }

    @objc
    func keyboardWillDisappear() {
        signUpTopConstraint.constant = 96
    }
}
