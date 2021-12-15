//
//  ProductDiscrebtionVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 03/05/1443 AH.
//

import UIKit

class ProductDiscrebtion : UIViewController{
	
	var product1: PharmacyStruct?
	var ProductFromVC2: DiscProduct?
	
	let imageBlogPage = UIImageView()
	let nameBlogPage = UILabel()
	let staly = UILabel()
	let textBlogPage = UILabel()
	let button = UIButton()
	
	//==========================================================================
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor =  UIColor(named: "BackG")

//		view.backgroundColor = UIColor (named: "myBackgroundColor2")
		
		imageBlogPage.layer.masksToBounds = true
		imageBlogPage.layer.cornerRadius = 10
		imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(imageBlogPage)
		imageBlogPage.backgroundColor =  UIColor(named: "BackG")
		
		NSLayoutConstraint.activate([
			imageBlogPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			imageBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6),
			imageBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -6),
			imageBlogPage.heightAnchor.constraint(equalToConstant: 300),
		])
		// ------
		nameBlogPage.textAlignment = .center
		nameBlogPage.backgroundColor =  UIColor(named: "namepro")
		nameBlogPage.textColor = UIColor(named: "TCbutton")
		nameBlogPage.font = .systemFont(ofSize: 20)
		nameBlogPage.layer.cornerRadius = 10
		nameBlogPage.clipsToBounds = true
		nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(nameBlogPage)
		
		NSLayoutConstraint.activate([
			nameBlogPage.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 20),
			nameBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			nameBlogPage.widthAnchor.constraint(equalToConstant: 350),
			nameBlogPage.heightAnchor.constraint(equalToConstant: 50)
		])
		//------
		staly.font = UIFont.systemFont(ofSize: 18)
		staly.backgroundColor = UIColor(named: "Cell")
		staly.numberOfLines = 0
		staly.textColor = .label
		staly.translatesAutoresizingMaskIntoConstraints = false
		staly.layer.cornerRadius = 10
		staly.clipsToBounds = true
		view.addSubview(staly)

		NSLayoutConstraint.activate([
			staly.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			staly.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
			staly.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			staly.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 20),
			staly.heightAnchor.constraint(equalToConstant: 130)
		])
		//-----
		textBlogPage.backgroundColor = UIColor(named: "Cell")
		textBlogPage.textColor = UIColor(named: "Tint")
		textBlogPage.font = .systemFont(ofSize: 18)
		textBlogPage.numberOfLines = 0
		textBlogPage.textAlignment = .right
		textBlogPage.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(textBlogPage)
		
		NSLayoutConstraint.activate([
			textBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			textBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
			textBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
			textBlogPage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 20),
			textBlogPage.heightAnchor.constraint(equalToConstant: 120)
			
		])
		//-----------
		button.setTitle( NSLocalizedString("Add to Cart 🛒 ", comment: ""), for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		button.layer.cornerRadius = 20
		button.clipsToBounds = true
		button.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(button)
		button.backgroundColor = UIColor(named: "Addcart")
		button.tintColor = UIColor(named: "Tint")

		
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
			button.widthAnchor.constraint(equalToConstant: 350),
			button.heightAnchor.constraint(equalToConstant: 40)
		])
		
		//Add a Simple Alert with Buttons
		button.addTarget(self, action: #selector(popupAlert), for: .touchUpInside)
		self.view.addSubview(button)
	}
	@objc func popupAlert(sender: UIButton!){
		
		
		let alert = UIAlertController(title: NSLocalizedString("Do you want to put this product in the cart", comment: ""),
									  message: "",
									  preferredStyle: .alert)
		
		alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default, handler: { action in
			CartService.shared.addStudent(student: self.ProductFromVC2!)
		}))
		alert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .cancel, handler: { action in
			print("Do not apply")}))
		
		self.present(alert, animated: true)
	}
}

