//
//  SceneDelegate.swift
//  PodcastAppCoordinators
//
//  Created by Илья Горяев on 15.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var coordinator: Coordinator?

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let window = UIWindow(windowScene: windowScene)
		let viewController = UINavigationController()
		let mainCoordinator = MainCoordinator(navigationController: viewController)
		self.coordinator = mainCoordinator
		viewController.navigationBar.isHidden = true
		mainCoordinator.start()
		self.window = window
		self.window?.rootViewController = viewController
		self.window?.makeKeyAndVisible()
	}
}

