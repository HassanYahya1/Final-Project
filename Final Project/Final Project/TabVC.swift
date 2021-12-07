//
//  ViewController.swift
//  Final Project
//
//  Created by Hassan Yahya on 01/05/1443 AH.
//
import UIKit


class TabVC: UITabBarController {
	fileprivate func createNavController(for rootViewController: UIViewController,
										 title: String,
										 image: UIImage) -> UIViewController {
		let navController = UINavigationController(rootViewController: rootViewController)
		navController.tabBarItem.title = title
		navController.tabBarItem.image = image
		navController.navigationBar.prefersLargeTitles = true
		rootViewController.navigationItem.title = title
		return navController
	}
	func setupVCs() {
		viewControllers = [
			createNavController(for: Pharmacies(), title: NSLocalizedString("Pharmacies", comment: ""), image: UIImage(systemName: "person.3")!),
			createNavController(for: CartViewController(), title: NSLocalizedString("Cart", comment: ""), image: UIImage(systemName: "cart.fill.badge.plus")!),
			//     createNavController(for:ChatVC(), title: NSLocalizedString("Chat", comment: ""), image: UIImage(systemName: "message")!),
//			createNavController(for:CamVC(), title: NSLocalizedString("Cam", comment: ""), image: UIImage(systemName: "camera")!),
			createNavController(for:MapVC(), title: NSLocalizedString("Location", comment: ""), image: UIImage(systemName: "location")!),
			createNavController(for: Profile(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!),
			
			
		]
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		tabBar.backgroundColor = .darkGray
		view.backgroundColor = .systemBackground
		UITabBar.appearance().barTintColor = .systemBackground
		tabBar.tintColor = .label
		setupVCs()
		
	}
}
