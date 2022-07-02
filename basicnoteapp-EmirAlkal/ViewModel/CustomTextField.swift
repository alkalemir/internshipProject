//
//  CustomTextField.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import UIKit

class CustomTextField: UIView, UITextFieldDelegate {

    let mainTextField   = UITextField()
    let customLabel     = UILabel()
    let errorLabel      = UILabel()

    var textFieldBottom: NSLayoutConstraint!

    let title: String
    let errorMessage: String
    let closure: (String) -> Bool
    
    var isOk: Bool
    
    init(title: String, errorMessage: String, closure: @escaping ((String) -> Bool)) {
        self.title = title
        self.errorMessage = errorMessage
        self.closure = closure
        isOk = false
        super.init(frame: .zero)
        configureLayout()
        
        mainTextField.placeholder = title
        mainTextField.attributedPlaceholder = NSAttributedString(
            string: title, attributes:
            [NSAttributedString.Key.foregroundColor: UIColor(red: 131 / 255, green: 141 / 255, blue: 146 / 255, alpha: 1)])
        mainTextField.delegate = self
        
        customLabel.text = title
        customLabel.font = customLabel.font.withSize(12)
        customLabel.textColor = .init(red: 131 / 255, green: 141 / 255, blue: 146 / 255, alpha: 1)
        customLabel.isHidden = true
        
        errorLabel.text = errorMessage
        errorLabel.textColor = .init(red: 0.867, green: 0.173, blue: 0, alpha: 1)
        errorLabel.font = errorLabel.font.withSize(11)
        errorLabel.isHidden = true
        appendIconToString(to: errorLabel, imageName: "Group", offSet: -4)
    }
    
    func configureLayout() {
        layer.borderColor = .init(red: 226 / 255, green: 230 / 255, blue: 234 / 255, alpha: 1)
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
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customLabel.isHidden = false
        mainTextField.placeholder = ""
        layer.borderColor = .init(red: 139 / 255, green: 140 / 255, blue: 255 / 255, alpha: 1)
        textFieldBottom.constant = -6
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        if closure(textField.text!) {
            errorLabel.isHidden = true
            layer.borderColor = .init(red: 0.886, green: 0.902, blue: 0.918, alpha: 1)
            print("validasyon ok")
            isOk = true
        } else {
            errorLabel.isHidden = false
            layer.borderColor = .init(red: 221 / 255, green: 44 / 244, blue: 0, alpha: 1)
            layer.borderWidth = 1
            layer.cornerRadius = 5
            print("validasyon not ok")
            isOk = false
        }
        
        if mainTextField.text!.isEmpty {
            customLabel.isHidden = true
            textFieldBottom.constant = -18
        }
        
        mainTextField.attributedPlaceholder = NSAttributedString(
            string: title,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 131 / 255, green: 141 / 255, blue: 146 / 255, alpha: 1)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func appendIconToString(to str: UILabel, imageName: String, offSet: CGFloat) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: imageName)
        // Set bound to reposition
        let imageOffsetY: CGFloat = offSet
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        let textAfterIcon = NSAttributedString(string: "  \(str.text!)")
        completeText.append(textAfterIcon)
        str.textAlignment = .center
        str.attributedText = completeText
}
