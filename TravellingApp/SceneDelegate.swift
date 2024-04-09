//
//  SceneDelegate.swift
//  TravellingApp
//
//  Created by Aizada on 25.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        let tabBarController = TabBarController()
        let registrationModule = RegistrationRouter.createModule()

        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        
        navigationController.pushViewController(registrationModule, animated: false)

        window?.rootViewController = navigationController

        window?.makeKeyAndVisible()
    }
}
