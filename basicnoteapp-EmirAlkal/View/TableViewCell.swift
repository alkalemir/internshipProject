//
//  TableViewCell.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 22.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    var title: UILabel!
    var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title = UILabel()
        content = UILabel()
        
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.textColor = .init(red: 35 / 255, green: 35 / 255, blue: 60 / 255, alpha: 1)
        content.textColor = .init(red: 139 / 255, green: 149 / 255, blue: 154 / 255, alpha: 1)
        
        content.font = content.font.withSize(14)
        title.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        content.numberOfLines = 3
        
        addSubview(title)
        addSubview(content)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            content.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            content.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
