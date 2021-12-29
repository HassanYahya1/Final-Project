//
//  wellcomScreen.swift
//  Final Project
//
//  Created by Hassan Yahya on 03/05/1443 AH.
//
//

import UIKit
import FirebaseAuth


class LogInVC: UIViewController, UITextFieldDelegate{
	
	let backImage = UIImageView()

	
	lazy var userEmail: UITextField = {
		
		let userEmail = UITextField()
		userEmail.translatesAutoresizingMaskIntoConstraints = false
		userEmail.layer.cornerRadius = 12
		userEmail.layer.borderWidth = 1
		userEmail.layer.borderColor = UIColor.lightGray.cgColor
		userEmail.textAlignment = .center
		userEmail.placeholder = "Email Address..."
		userEmail.backgroundColor = UIColor(named: "Cell")
		userEmail.textColor =  UIColor(named: "Tint")
		
		userEmail.text = "Hassan@gmail.com"
		return userEmail
	}()
	lazy var userPassword: UITextField = {
		let userPassword = UITextField()
		userPassword.translatesAutoresizingMaskIntoConstraints = false
		userPassword.layer.cornerRadius = 12
		userPassword.layer.borderWidth = 1
		userPassword.textAlignment = .center
		
		userPassword.layer.borderColor = UIColor.lightGray.cgColor
		userPassword.placeholder = NSLocalizedString(" Password...", comment: "")
		userPassword.backgroundColor =  UIColor(named: "Cell")
		userPassword.textColor =  UIColor(named: "Tint")
		userPassword.text = "123123"
		return userPassword
	}()
	lazy var loginButton: UIButton = {
		let loginButton = UIButton()
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		loginButton.setTitle(NSLocalizedString("LogIn", comment: ""), for: .normal)
		loginButton.setTitleColor(.white, for: .normal)
		loginButton.backgroundColor = UIColor(named: "LoginB")
		loginButton.tintColor = UIColor(named: "Tint")
		loginButton.layer.cornerRadius = 12
		loginButton.layer.masksToBounds = true
		loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
		loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
		return loginButton
	}()
	lazy var labelToRegister: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
//		label.backgroundColor =  UIColor(named: "BackG")
		label.textColor =  UIColor(named: "Tint")
		label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
		label.text = NSLocalizedString("Did you have account? ", comment: "")
		return label
	}()
	lazy var registerButton: UIButton = {
		let registerButton = UIButton()
		registerButton.translatesAutoresizingMaskIntoConstraints = false
		registerButton.setTitle(NSLocalizedString("SignUp", comment: ""), for: .normal)
		registerButton.setTitleColor(.blue, for: .normal)
//		registerButton.backgroundColor =  UIColor(named: "BackG")
		registerButton.tintColor =  UIColor(named: "Tint")
		registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
		registerButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
		return registerButton
	}()
	lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "looo")
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 25
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(backImage)
//		backImage.image = UIImage(named: "bak")
		backImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			backImage.topAnchor.constraint(equalTo: view.topAnchor),
			backImage.rightAnchor.constraint(equalTo: view.rightAnchor),
			backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			backImage.leftAnchor.constraint(equalTo: view.leftAnchor)

		])

		userEmail.delegate = self
		userPassword.delegate = self
		view.backgroundColor =  UIColor(named: "BackG")
		title = "Log In"
		//Constraint imageView
		view.addSubview(imageView)
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
			imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 400),
			imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 150/150)
		])
		//Constraint userEmail
		view.addSubview(userEmail)
		NSLayoutConstraint.activate([
			userEmail.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			userEmail.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
			userEmail.widthAnchor.constraint(equalToConstant: 350),
			userEmail.heightAnchor.constraint(equalToConstant: 40),
		])
		//Constraint userPassword
		view.addSubview(userPassword)
		NSLayoutConstraint.activate([
			userPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			userPassword.topAnchor.constraint(equalTo: userEmail.bottomAnchor, constant: 16),
			userPassword.widthAnchor.constraint(equalToConstant: 350),
			userPassword.heightAnchor.constraint(equalToConstant: 40),
		])
		//Constraint loginButton
		view.addSubview(loginButton)
		NSLayoutConstraint.activate([
			loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45),
			loginButton.topAnchor.constraint(equalTo: userPassword.bottomAnchor, constant: 16),
			loginButton.widthAnchor.constraint(equalToConstant: 300),
			loginButton.heightAnchor.constraint(equalToConstant: 40),
		])
		//Constraint labelToRegister
		view.addSubview(labelToRegister)
		NSLayoutConstraint.activate([
			labelToRegister.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
			labelToRegister.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
			labelToRegister.widthAnchor.constraint(equalToConstant: 300),
			labelToRegister.heightAnchor.constraint(equalToConstant: 40),
		])
		//Constraint registerButton
		view.addSubview(registerButton)
		NSLayoutConstraint.activate([
			registerButton.rightAnchor.constraint(equalTo: labelToRegister.leftAnchor, constant: 200),
			registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
			registerButton.widthAnchor.constraint(equalToConstant: 50),
			registerButton.heightAnchor.constraint(equalToConstant: 40),
		])
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		userPassword.resignFirstResponder()
		userEmail.resignFirstResponder()
		return true
	}
	@objc private func loginButtonTapped() {
		// linked with firebase
		let email = userEmail.text ?? ""
		let password = userPassword.text ?? ""
		if email.isEmpty || password.isEmpty {
			return
		}
		Auth.auth().signIn(withEmail: email, password: password) { result, error in
			if error != nil {
				print(error as Any)
				return    }
			//oben TabVC bage
			let vc = TabVC()
			let nav = UINavigationController()
			nav.viewControllers = [vc]
			nav.modalPresentationStyle = .fullScreen
			nav.modalTransitionStyle = .flipHorizontal
			self.present(nav, animated: true, completion: nil)
		}
	}
	//  oben RegisterVC bage
	@objc private func registerButtonTapped() {
		let vc = RegisterVC()
		vc.modalPresentationStyle = .fullScreen
		self.present(vc, animated: true, completion: nil)
	}
}
