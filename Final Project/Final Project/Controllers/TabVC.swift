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
			createNavController(for: Pharmacies(),
								   title: NSLocalizedString("Pharmacies", comment: "")
								   , image: UIImage(systemName: "text.badge.plus")!.withTintColor(UIColor( #colorLiteral(red: 0.1595600843, green: 0.810018003, blue: 0.7768369317, alpha: 1)))),
			createNavController(for: CartViewController(), title: NSLocalizedString("Cart", comment: ""), image: UIImage(systemName: "cart.fill.badge.plus")!.withTintColor(UIColor( #colorLiteral(red: 0.1595600843, green: 0.810018003, blue: 0.7768369317, alpha: 1)))),
			createNavController(for:MapVC(), title: NSLocalizedString("Location", comment: ""), image: UIImage(systemName: "location.square")!.withTintColor(UIColor( #colorLiteral(red: 0.1595600843, green: 0.810018003, blue: 0.7768369317, alpha: 1)))),
			createNavController(for: Profile(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person.circle")!.withTintColor(UIColor( #colorLiteral(red: 0.1595600843, green: 0.810018003, blue: 0.7768369317, alpha: 1)))),
			
		]
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		tabBar.backgroundColor = .systemGray4
		view.backgroundColor = .blue
		UITabBar.appearance().barTintColor = .systemBackground
		tabBar.tintColor = .systemBlue
		setupVCs()
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
		swipeLeft.direction = .left
		self.view.addGestureRecognizer(swipeLeft)
		
		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
		swipeRight.direction = .right
		self.view.addGestureRecognizer(swipeRight)
		
		let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
		swipeUp.direction = .up
		self.view.addGestureRecognizer(swipeUp)
		
		let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
		swipeDown.direction = .down
		self.view.addGestureRecognizer(swipeDown)
		
	}
	
	@objc func handleGesture(gesture: UISwipeGestureRecognizer) {
		if gesture.direction == .right {
			present(
				UINavigationController(rootViewController: FavouriteVC()),
				animated: true,
				completion: nil
			)
		}
	}
	
}


