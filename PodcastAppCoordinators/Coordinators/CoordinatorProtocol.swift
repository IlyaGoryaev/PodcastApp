//
//  CoordinatorProtocol.swift
//  PodcastAppCoordinators
//
//  Created by Илья Горяев on 15.10.2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject{
	
	var navigationController: UINavigationController { set get }
	
	func start()
	
}
