//
//  ProfileTableViewCell.swift
//  TravellingApp
//
//  Created by Aizada on 16.04.2024.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let valueTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(valueTextField)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            valueTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            valueTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            valueTextField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            valueTextField.widthAnchor.constraint(equalToConstant: 200) 
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
