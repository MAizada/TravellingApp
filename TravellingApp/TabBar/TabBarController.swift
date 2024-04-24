//
//  TabBarController.swift
//  TravellingApp
//
//  Created by Aizada on 03.04.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeView()
        let exploreVC = ExploreView()
        let chatVC = ChatView()
        let favoritesVC = FavoritesView()
        let profileVC = ProfileView()
        
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        exploreVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "globe"), tag: 1)
        chatVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "ellipsis.message.fill"), tag: 2)
        favoritesVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "suit.heart.fill"), tag: 3)
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.fill"), tag: 4)
        
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)
        exploreVC.tabBarItem.selectedImage = UIImage(systemName: "globe")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)
        chatVC.tabBarItem.selectedImage = UIImage(systemName: "ellipsis.message.fill")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)
        favoritesVC.tabBarItem.selectedImage = UIImage(systemName: "suit.heart.fill")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)
        profileVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")?.withTintColor(Colors.customBlue, renderingMode: .alwaysOriginal)
        
        viewControllers = [homeVC, exploreVC, chatVC, favoritesVC, profileVC]
    }
}
