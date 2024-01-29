//
//  SceneDelegate.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let initialVC = MainScene.create()
        let navigationVC = UINavigationController(rootViewController: initialVC)
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = navigationVC
        window.makeKeyAndVisible()
    }
}

