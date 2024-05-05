//
//  SavedView.swift
//  TravellingApp
//
//  Created by Aizada on 04.04.2024.
//

import UIKit

final class FavoritesView: UIViewController {
   
    private let savedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Saved"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let eventsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Events"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let eventsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let packagesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Packages"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let packagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let trips: [Trip] = [
//        Trip(image: UIImage(named: "RedFishLake"), title: "RedFish Lake", rating: 4.5, location: "Idaho", price: 40, isFavorite: true),
//        Trip(image: UIImage(named: "MaligneLake"), title: "Maligne Lake", rating: 4.8, location: "Canada", price: 40, isFavorite: true),
    ]
    
    let packages: [Package] = [
        Package(image: UIImage(named: "KingAndDuke"), name: "King + Duke", price: 50),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        view.addSubview(savedLabel)
        view.addSubview(eventsLabel)
        view.addSubview(eventsTableView)
        view.addSubview(packagesLabel)
        view.addSubview(packagesTableView)
        
        NSLayoutConstraint.activate([
            savedLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            savedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            eventsLabel.topAnchor.constraint(equalTo: savedLabel.bottomAnchor, constant: 20),
            eventsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            eventsTableView.topAnchor.constraint(equalTo: eventsLabel.bottomAnchor, constant: 10),
            eventsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eventsTableView.heightAnchor.constraint(equalToConstant: 300),
            
            packagesLabel.topAnchor.constraint(equalTo: eventsTableView.bottomAnchor, constant: 20),
            packagesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            packagesTableView.topAnchor.constraint(equalTo: packagesLabel.bottomAnchor, constant: 10),
            packagesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            packagesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            packagesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.register(EventsTableViewCell.self, forCellReuseIdentifier: "eventsCell")
        
        packagesTableView.delegate = self
        packagesTableView.dataSource = self
        packagesTableView.register(PackagesTableViewCell.self, forCellReuseIdentifier: "packagesCell")
    }
    
    private func loadData() {
      
    }
}

extension FavoritesView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == eventsTableView {
            return trips.count
        } else {
            return packages.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == eventsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "eventsCell", for: indexPath) as! EventsTableViewCell
            cell.configure(with: trips[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "packagesCell", for: indexPath) as! PackagesTableViewCell
            cell.configure(with: packages[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
