//
//  ChatTableViewCell.swift
//  TravellingApp
//
//  Created by Aizada on 09.04.2024.
//

import UIKit

struct ChatMessage {
    let avatarImage: UIImage
    let name: String
    let messageIcon: UIImage
    let message: String
    let time: String
}

final class ChatTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let messageIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(messageIconImageView)
        addSubview(messageLabel)
        addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            messageIconImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            messageIconImageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            messageIconImageView.widthAnchor.constraint(equalToConstant: 20),
            messageIconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            messageLabel.centerYAnchor.constraint(equalTo: messageIconImageView.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: messageIconImageView.trailingAnchor, constant: 5),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            timeLabel.topAnchor.constraint(equalTo: messageIconImageView.bottomAnchor, constant: 5),
            timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    // MARK: - Configure Cell
    
    func configure(with model: ChatMessage) {
        avatarImageView.image = model.avatarImage
        nameLabel.text = model.name
        messageIconImageView.image = model.messageIcon
        messageLabel.text = model.message
        timeLabel.text = model.time
    }
}
