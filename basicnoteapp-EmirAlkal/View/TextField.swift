//
//  CustomTextField.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import UIKit

class TextField: UIView, UITextFieldDelegate {

    // MARK: - Properties
    
    let mainTextField   = UITextField()
    let customLabel     = UILabel()
    let errorLabel      = UILabel()

    var textFieldBottom: NSLayoutConstraint!

    let title: String
    let errorMessage: String
    let closure: (String) -> Bool
    
    // MARK: - Constructors
    
    init(title: String, errorMessage: String, closure: @escaping ((String) -> Bool)) {
        self.title = title
        self.errorMessage = errorMessage
        self.closure = closure
        super.init(frame: .zero)
        
        configureLayout()
        errorLabel.appendIconToString(imageName: "Group", offSet: -4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - TextField Delegate Functions
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customLabel.isHidden = false
        mainTextField.placeholder = ""
        layer.borderColor = UIColor(named: "purple")?.cgColor
        textFieldBottom.constant = -6
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        if closure(textField.text!) {
            errorLabel.isHidden = true
            layer.borderColor = UIColor(named: "lightGrey")?.cgColor
        } else {
            errorLabel.isHidden = false
            layer.borderColor = UIColor(named: "red")?.cgColor
            layer.borderWidth = 1
            layer.cornerRadius = 5
        }
        
        if mainTextField.text!.isEmpty {
            customLabel.isHidden = true
            textFieldBottom.constant = -18
        }
        
        mainTextField.attributedPlaceholder = NSAttributedString(
            string: title,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "grey")!])
    }
}
