//
//  MainCoordinator.swift
//  PodcastAppCoordinators
//
//  Created by Илья Горяев on 15.10.2023.
//

import SwiftUI


final class MainCoordinator: Coordinator{
	
	var navigationController: UINavigationController
	
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		var view = ContentView()
		view.mainCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: false)
	}
	
	func openDetailScreen(){
		var view = DetailScreen()
		view.mainCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func openPodcastDetailScreen(){
		var view = PodcastDetailSwiftUI()
		view.mainCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func backAction(){
		navigationController.popViewController(animated: true)
	}
}
