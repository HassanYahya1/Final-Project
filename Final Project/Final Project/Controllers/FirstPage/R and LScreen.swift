////
////  SignUpScreen.swift
////  Final Project
////
////  Created by Hassan Yahya on 03/05/1443 AH.
////
////
//

import UIKit

class LoginOrRegisterVC: UIViewController {
	
		let backImage = UIImageView()
	
	lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "mod")
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		//		imageView.backgroundColor =  UIColor(named: "Cell")
		
		return imageView
	}()
	lazy var loginButton: UIButton = {
		let loginButton = UIButton()
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		loginButton.setTitle(NSLocalizedString("LogIn", comment: ""), for: .normal)
		loginButton.setTitleColor(.black, for: .normal)
		loginButton.backgroundColor = UIColor(named: "LoginB")
		loginButton.layer.cornerRadius = 10
//		loginButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
		loginButton.layer.masksToBounds = true
		loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
		loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
		return loginButton
	}()
	
	lazy var registerButton: UIButton = {
		let registerButton = UIButton()
		registerButton.translatesAutoresizingMaskIntoConstraints = false
		registerButton.setTitle(NSLocalizedString("SignUp", comment: ""), for: .normal)
		registerButton.setTitleColor(.black, for: .normal)
		registerButton.backgroundColor =  UIColor(named: "Cell")
		registerButton.tintColor =  UIColor(named: "Tint")
		registerButton.layer.cornerRadius = 10
		registerButton.layer.masksToBounds = true
		registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
		registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
		return registerButton
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(named: "BackG")
		
		
		view.addSubview(backImage)
		backImage.image = UIImage(named: "back")
		backImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			backImage.topAnchor.constraint(equalTo: view.topAnchor),
			backImage.rightAnchor.constraint(equalTo: view.rightAnchor),
			backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			backImage.leftAnchor.constraint(equalTo: view.leftAnchor)

		])
		//Constraint imageView
		view.addSubview(imageView)
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
			imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 300),
			imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 100/100)
		])
		//Constraint loginButton
		view.addSubview(loginButton)
		NSLayoutConstraint.activate([
			loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			loginButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 90),
			loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
			loginButton.heightAnchor.constraint(equalToConstant: 40),
			
		])
		//Constraint registerButton
		view.addSubview(registerButton)
		NSLayoutConstraint.activate([
			registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
			registerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
			registerButton.heightAnchor.constraint(equalToConstant: 40),
		])
	}
	
	// make loginButtonTapped works
	@objc private func loginButtonTapped() {
		let vc = LogInVC()
		vc.modalPresentationStyle = .fullScreen
		self.present(vc, animated: true, completion: nil)
	}
	// make registerButtonTapped works
	@objc private func registerButtonTapped() {
		let vc = RegisterVC()
		vc.modalPresentationStyle = .fullScreen
		self.present(vc, animated: true, completion: nil)
	}
}
