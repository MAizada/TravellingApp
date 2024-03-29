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

        let registrationModule = RegistrationRouter.createModule()
        window?.rootViewController = UINavigationController(rootViewController: registrationModule)
        window?.makeKeyAndVisible()
    }
}
