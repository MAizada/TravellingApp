//
//  ChatView.swift
//  TravellingApp
//
//  Created by Aizada on 04.04.2024.
//

import UIKit

final class ChatView: UIViewController {
   
    // MARK: - UI Elements
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chat"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let writeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pen"), for: .normal)
        button.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return button
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        return searchBar
    }()
    
    private let chatTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var chatData: [ChatMessage] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.lightGray
        
        setupUI()
        setupTableView()
        loadData()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(chatLabel)
        view.addSubview(writeButton)
        view.addSubview(searchBar)
        view.addSubview(chatTableView)
        
        NSLayoutConstraint.activate([
            chatLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            chatLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            writeButton.centerYAnchor.constraint(equalTo: chatLabel.centerYAnchor),
            writeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            searchBar.topAnchor.constraint(equalTo: chatLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            chatTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "chatCell")
    }
    
    private func loadData() {
        chatData = [
            ChatMessage(avatarImage: UIImage(systemName: "person")!, name: "Alex", messageIcon: UIImage(named: "startButton")!.withTintColor(.black, renderingMode: .alwaysOriginal), message: "Hello!", time: "10:00 AM"),
            ChatMessage(avatarImage: UIImage(systemName: "person")!, name: "Anna", messageIcon: UIImage(named: "startButton")!.withTintColor(.black, renderingMode: .alwaysOriginal), message: "Hi!", time: "10:05 AM"),
        ]
    }
}

// MARK: - UITableViewDataSource

extension ChatView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatTableViewCell
        cell.configure(with: chatData[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ChatView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
