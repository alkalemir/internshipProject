//
//  UILabel+Ext.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 9.07.2022.
//

import UIKit

extension UILabel {
    func appendIconToString(imageName: String, offSet: CGFloat) {
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
        let textAfterIcon = NSAttributedString(string: "  \(self.text!)")
        completeText.append(textAfterIcon)
        self.textAlignment = .center
        self.attributedText = completeText
    }

}
