//
//  HomeView.swift
//  TravellingApp
//
//  Created by Aizada on 03.04.2024.
//

import UIKit

final class HomeView: UIViewController {
    
    // MARK: - UI Elements
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Current Location", for: .normal)
        button.setImage(UIImage(named: "location"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.layer.cornerRadius = 15
        return searchBar
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "list"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.customBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    private let categoriesLabel = createLabel(with: "Categories")
    private let seeAllCategoriesButton = createButton()
    
    private lazy var categoriesCollectionView: UICollectionView = {
        let collectionView = HomeView.createCollectionView()
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var tripsCollectionView: UICollectionView = {
        let collectionView = HomeView.createCollectionView()
        collectionView.register(TopTripCell.self, forCellWithReuseIdentifier: "TopTripCell")
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var groupTripsCollectionView: UICollectionView = {
        let collectionView = HomeView.createCollectionView()
        collectionView.register(GroupTripCell.self, forCellWithReuseIdentifier: "GroupTripCell")
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private let topTripsLabel = createLabel(with: "Top Trips")
    private let seeAllTopTripsButton = createButton()
    
    private let groupTripsLabel = createLabel(with: "Group Trips")
    private let seeAllGroupTripsButton = createButton()
    
    let categories = ["Lakes", "Sea", "Mountain", "Forest", "City"]
    
    let trips: [Trip] = [
        Trip(image: UIImage(named: "RedFishLake"), title: "RedFish Lake", rating: 4.5, location: "Idaho", price: 40, isFavorite: true),
        Trip(image: UIImage(named: "MaligneLake"), title: "Maligne Lake", rating: 4.8, location: "Canada", price: 40, isFavorite: true),
    ]
    
    let groupTrips: [GroupTrip] = [
        GroupTrip(image: UIImage(named: "mountainTrip"), title: "Mountain Trip", secontTitle: "Seelisburg", location: "Norway")
    ]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = Colors.lightGray
        
        [
            locationLabel,
            locationButton,
            notificationButton,
            searchBar,
            listButton,
            categoriesLabel,
            seeAllCategoriesButton,
            categoriesCollectionView,
            topTripsLabel,
            seeAllTopTripsButton,
            tripsCollectionView,
            groupTripsLabel,
            seeAllGroupTripsButton,
            groupTripsCollectionView
        ].forEach { view.addSubview($0) }
        
        setupConstraints()
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            locationLabel.widthAnchor.constraint(equalToConstant: 70),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationButton.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 30),
            locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            locationButton.widthAnchor.constraint(equalToConstant: 150),
            locationButton.heightAnchor.constraint(equalToConstant: 20),
            
            notificationButton.topAnchor.constraint(equalTo: locationButton.topAnchor),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            notificationButton.widthAnchor.constraint(equalToConstant: 20),
            notificationButton.heightAnchor.constraint(equalToConstant: 20),
            
            searchBar.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.widthAnchor.constraint(equalToConstant: 325),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            listButton.topAnchor.constraint(equalTo: searchBar.topAnchor),
            listButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            listButton.widthAnchor.constraint(equalToConstant: 60),
            listButton.heightAnchor.constraint(equalToConstant: 40),
            
            categoriesLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesLabel.heightAnchor.constraint(equalToConstant: 20),
            
            seeAllCategoriesButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            seeAllCategoriesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            seeAllCategoriesButton.widthAnchor.constraint(equalToConstant: 80),
            seeAllCategoriesButton.heightAnchor.constraint(equalToConstant: 20),
            
            categoriesCollectionView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 10),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 40),
            
            topTripsLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 20),
            topTripsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topTripsLabel.heightAnchor.constraint(equalToConstant: 20),
            
            seeAllTopTripsButton.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 20),
            seeAllTopTripsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            seeAllTopTripsButton.widthAnchor.constraint(equalToConstant: 80),
            seeAllTopTripsButton.heightAnchor.constraint(equalToConstant: 20),
            
            tripsCollectionView.topAnchor.constraint(equalTo: topTripsLabel.bottomAnchor, constant: 10),
            tripsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tripsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tripsCollectionView.heightAnchor.constraint(equalToConstant: 212),
            
            groupTripsLabel.topAnchor.constraint(equalTo: tripsCollectionView.bottomAnchor, constant: 20),
            groupTripsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            groupTripsLabel.heightAnchor.constraint(equalToConstant: 20),
            
            seeAllGroupTripsButton.topAnchor.constraint(equalTo: tripsCollectionView.bottomAnchor, constant: 20),
            seeAllGroupTripsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            seeAllGroupTripsButton.widthAnchor.constraint(equalToConstant: 80),
            seeAllGroupTripsButton.heightAnchor.constraint(equalToConstant: 20),
            
            groupTripsCollectionView.topAnchor.constraint(equalTo: groupTripsLabel.bottomAnchor, constant: 10),
            groupTripsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            groupTripsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            groupTripsCollectionView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    // MARK: - Helper Functions
    
    private static func createLabel(with text: String, fontSize: CGFloat = 16, color: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.textColor = color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private static func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private static func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categories.count
        case tripsCollectionView:
            return trips.count
        case groupTripsCollectionView:
            return groupTrips.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
           switch collectionView {
           case tripsCollectionView:
               let trip = trips[indexPath.row]
               let tripDetailVC = TripDetailView()
               tripDetailVC.trip = trip
               navigationController?.pushViewController(tripDetailVC, animated: true)
               
           default:
               break
           }
       }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.category = categories[indexPath.row]
            return cell
            
        case tripsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopTripCell", for: indexPath) as! TopTripCell
            let trip = trips[indexPath.row]
            cell.configure(with: trip)
            return cell
            
        case groupTripsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupTripCell", for: indexPath) as! GroupTripCell
            let groupTrip = groupTrips[indexPath.row]
            cell.configure(with: groupTrip)
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case categoriesCollectionView:
            return CGSize(width: 100, height: 40)
            
        case tripsCollectionView:
            return CGSize(width: 150, height: 200)
            
        case groupTripsCollectionView:
            return CGSize(width: 300, height: 130)
            
        default:
            return CGSize(width: 100, height: 100)
        }
    }
}
