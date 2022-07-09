//
//  CustomTextField+Ext.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 9.07.2022.
//

import UIKit

// MARK: - Configure Layout

extension TextField {
    
    func configureMainTextField() {
        mainTextField.placeholder = title
        mainTextField.attributedPlaceholder = NSAttributedString(
            string: title, attributes:
            [NSAttributedString.Key.foregroundColor: UIColor(named: "grey")!])
        mainTextField.delegate = self
    }
    
    func configureCustomLabel() {
        customLabel.text = title
        customLabel.font = customLabel.font.withSize(12)
        customLabel.textColor = UIColor(named: "grey")
        customLabel.isHidden = true
    }
    
    func configureErrorLabel() {
        errorLabel.text = errorMessage
        errorLabel.textColor = UIColor(named: "red")
        errorLabel.font = errorLabel.font.withSize(11)
        errorLabel.isHidden = true
    }
    
    func configureLayout() {
        layer.borderColor = UIColor(named: "lightGrey")?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        
        addSubview(mainTextField)
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        textFieldBottom = mainTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)

        NSLayoutConstraint.activate([
            mainTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            mainTextField.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            mainTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            textFieldBottom
        ])
        
        addSubview(customLabel)
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            customLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18)
        ])
        
        addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            errorLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 4)
        ])
        
        configureMainTextField()
        configureCustomLabel()
        configureErrorLabel()
    }
}
