import UIKit

final class NotificationView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UI Elements
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private let notificationsTableView = UITableView()
    
    private let notifications = [
        ["date": "Today", "notifications": ["New offer for your trip to USA"]],
        ["date": "Yesterday", "notifications": ["Reminder: Don't forget to check your travel plans"]],
        ["date": "April 20, 2024", "notifications": ["App update available: New features added"]]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Notifications"
        
        setupUI()
    }
    
    private func setupUI() {
        notificationsTableView.dataSource = self
        notificationsTableView.delegate = self
        notificationsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "notificationCell")
        
        view.addSubview(backButton)
        view.addSubview(notificationsTableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        notificationsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            notificationsTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            notificationsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource & UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let notificationsInSection = notifications[section]["notifications"] as? [String] {
            return notificationsInSection.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return notifications[section]["date"] as? String
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath)
        if let notificationsInSection = notifications[indexPath.section]["notifications"] as? [String] {
            cell.textLabel?.text = notificationsInSection[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let notificationsInSection = notifications[indexPath.section]["notifications"] as? [String] {
            print("Selected notification: \(notificationsInSection[indexPath.row])")
        }
    }
}
