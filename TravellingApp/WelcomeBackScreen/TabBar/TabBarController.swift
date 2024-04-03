//
//  TabBarController.swift
//  TravellingApp
//
//  Created by Aizada on 03.04.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeView()
        let locationVC = LocationView()
        let chatVC = ChatView()
        let favoritesVC = FavoritesView()
        let profileVC = ProfileView()

        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "house"), tag: 0)
        locationVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "location"), tag: 1)
        chatVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "ellipsis.message.fill"), tag: 2)
        favoritesVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "suit.heart.fill"), tag: 3)
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.fill"), tag: 4)
        
        homeVC.tabBarItem.selectedImage = UIImage(named: "house")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)
               locationVC.tabBarItem.selectedImage = UIImage(named: "location")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)
               chatVC.tabBarItem.selectedImage = UIImage(systemName: "ellipsis.message.fill")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)
               favoritesVC.tabBarItem.selectedImage = UIImage(systemName: "suit.heart.fill")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)
               profileVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)


        viewControllers = [homeVC, locationVC, chatVC, favoritesVC, profileVC]
    }
}
