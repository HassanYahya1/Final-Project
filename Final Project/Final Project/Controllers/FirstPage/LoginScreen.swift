//
//  wellcomScreen.swift
//  Final Project
//
//  Created by Hassan Yahya on 03/05/1443 AH.
//
//

import UIKit
import FirebaseAuth


class LogInVC: UIViewController {
   lazy var userEmail: UITextField = {
	let userEmail = UITextField()
	 userEmail.translatesAutoresizingMaskIntoConstraints = false
	 userEmail.layer.cornerRadius = 12
	 userEmail.layer.borderWidth = 1
	 userEmail.layer.borderColor = UIColor.lightGray.cgColor
	 userEmail.placeholder = "Email Address..."
	 userEmail.backgroundColor = .secondarySystemBackground
	   userEmail.text = "Hassan@gmail.com"
	return userEmail
  }()
  lazy var userPassword: UITextField = {
	let userPassword = UITextField()
	userPassword.translatesAutoresizingMaskIntoConstraints = false
	userPassword.layer.cornerRadius = 12
	userPassword.layer.borderWidth = 1
	userPassword.layer.borderColor = UIColor.lightGray.cgColor
	userPassword.placeholder = " Password..."
	userPassword.backgroundColor = .secondarySystemBackground
	  userPassword.text = "123123"
	return userPassword
  }()
  lazy var loginButton: UIButton = {
	let loginButton = UIButton()
	loginButton.translatesAutoresizingMaskIntoConstraints = false
	loginButton.setTitle("Log In", for: .normal)
	loginButton.setTitleColor(.black, for: .normal)
	loginButton.backgroundColor = .systemTeal
	loginButton.layer.cornerRadius = 12
	loginButton.layer.masksToBounds = true
	loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
	loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
	return loginButton
  }()
  lazy var labelToRegister: UILabel = {
	let label = UILabel()
	label.translatesAutoresizingMaskIntoConstraints = false
	label.backgroundColor = .white
	label.textColor = .black
	label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
	label.text = "Don’t have account? "
	return label
  }()
  lazy var registerButton: UIButton = {
	let registerButton = UIButton()
	registerButton.translatesAutoresizingMaskIntoConstraints = false
	registerButton.setTitle("Sign up", for: .normal)
	registerButton.setTitleColor(.blue, for: .normal)
	registerButton.backgroundColor = .white
	registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
	registerButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
	return registerButton
  }()
  lazy var imageView: UIImageView = {
	let imageView = UIImageView()
	imageView.image = UIImage(named: "mod")
	imageView.contentMode = .scaleAspectFill
	imageView.layer.cornerRadius = 25
	imageView.translatesAutoresizingMaskIntoConstraints = false
	return imageView
  }()
  override func viewDidLoad() {
	super.viewDidLoad()
	view.backgroundColor = .white
	title = "Log In"
	//Constraint imageView
	view.addSubview(imageView)
	NSLayoutConstraint.activate([
		imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
					imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
					imageView.heightAnchor.constraint(equalToConstant: 300),
					imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 100/100)
	])
	//Constraint userEmail
	view.addSubview(userEmail)
	NSLayoutConstraint.activate([
	  userEmail.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
	  userEmail.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
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
	  labelToRegister.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40),
	  labelToRegister.widthAnchor.constraint(equalToConstant: 300),
	  labelToRegister.heightAnchor.constraint(equalToConstant: 40),
	])
	//Constraint registerButton
	view.addSubview(registerButton)
	NSLayoutConstraint.activate([
	  registerButton.rightAnchor.constraint(equalTo: labelToRegister.leftAnchor, constant: 170),
	  registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40),
	  registerButton.widthAnchor.constraint(equalToConstant: 50),
	  registerButton.heightAnchor.constraint(equalToConstant: 40),
	])
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
   vc.modalPresentationStyle = .fullScreen
   self.present(vc, animated: true, completion: nil)
   }
 }
//  oben RegisterVC bage
  @objc private func registerButtonTapped() {
	let vc = RegisterVC()
	vc.modalPresentationStyle = .fullScreen
	self.present(vc, animated: true, completion: nil)
  }
}


//import UIKit
//import FirebaseAuth
//
//class WelcomeScreen: UIViewController {
//
//	let containerView: UIView = {
//		let view = UIView()
//		view.backgroundColor = UIColor(#colorLiteral(red: 0.8981755376, green: 1, blue: 0.9623885751, alpha: 1))
//		view.layer.borderWidth = 0.25
//		view.layer.borderColor = UIColor.white.cgColor
//		view.layer.cornerRadius = 20
//		view.clipsToBounds = true
//		return view
//	}()
//
//	let illustrationImage: UIImageView = {
//		let image = UIImageView()
//		image.image = UIImage(named: "Cake1")
//		image.contentMode = .scaleAspectFill
//		image.clipsToBounds = true
//		image.layer.cornerRadius = 30
//		return image
//	}()
//
//	let titleLabel: UILabel = {
//	  let title = UILabel()
//		title.backgroundColor = .clear
//		title.text = "Welcome"
//		title.font = UIFont.systemFont(ofSize: 29, weight: .bold)
//		title.textColor = UIColor(#colorLiteral(red: 0.906963408, green: 0.7648715973, blue: 0.9058654904, alpha: 1) )
//		title.textAlignment = .center
//		title.numberOfLines = 0
//		return title
//	}()
//
//	let subTitle: UILabel = {
//	  let subTitle = UILabel()
//		subTitle.backgroundColor = .clear
//		subTitle.text = "share your moments with one pices Cake🧁"
//		subTitle.font = UIFont.systemFont(ofSize: 15, weight: .regular)
//		subTitle.textColor = UIColor( #colorLiteral(red: 0.05837889761, green: 0.04676074535, blue: 0.0519445911, alpha: 1))
//		subTitle.textAlignment = .center
//		subTitle.numberOfLines = 0
//		return subTitle
//	}()
//
//	let signInButton: UIButton = {
//		let button = UIButton(type: .system)
//		button.setupButton(with: "Sign up")
//		return button
//	}()
//
//	let loginButton: UIButton = {
//		let button = UIButton(type: .system)
//		button.setupButton(with: "Log in")
//		return button
//	}()
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//		view.backgroundColor = UIColor(#colorLiteral(red: 1, green: 0.8280280828, blue: 0.9201447368, alpha: 1))
//
//		setupViews()
//	}
//
//	override func viewDidAppear(_ animated: Bool) {
//		super.viewDidAppear(animated)
//
//		if isUserSignedIn() {
//			self.dismiss(animated: true, completion: nil)
//		}
//
//	}
//
//	private func setupViews() {
//
//		view.addSubview(containerView)
//		containerView.translatesAutoresizingMaskIntoConstraints                                                     = false
//		containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
//		containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
//		containerView.widthAnchor.constraint(equalToConstant: 325).isActive                                         = true
//		containerView.heightAnchor.constraint(equalToConstant: 395).isActive                                        = true
//
//
//		let vStack = UIStackView(arrangedSubviews: [signInButton, loginButton])
//		containerView.addSubview(vStack)
//		vStack.translatesAutoresizingMaskIntoConstraints = false
//		vStack.distribution = .fillEqually
//		vStack.spacing      = 10
//		vStack.translatesAutoresizingMaskIntoConstraints = false
//		vStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive                 = true
//		vStack.heightAnchor.constraint(equalToConstant: 40).isActive                                                = true
//		vStack.widthAnchor.constraint(equalToConstant: 190).isActive                                                = true
//		vStack.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive            = true
//		loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//		signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
//
//		containerView.addSubview(subTitle)
//		subTitle.translatesAutoresizingMaskIntoConstraints                                                          = false
//		subTitle.bottomAnchor.constraint(equalTo: vStack.topAnchor, constant: -30).isActive                         = true
//		subTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive                            = true
//		subTitle.widthAnchor.constraint(equalToConstant: 305).isActive                                              = true
//
//		containerView.addSubview(titleLabel)
//		titleLabel.translatesAutoresizingMaskIntoConstraints                                                        = false
//		titleLabel.bottomAnchor.constraint(equalTo: subTitle.topAnchor, constant: -40).isActive                     = true
//		titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive                          = true
//
//
//		containerView.addSubview(illustrationImage)
//		illustrationImage.translatesAutoresizingMaskIntoConstraints = false
//		illustrationImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -30).isActive             = true
//		illustrationImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive     = true
//		illustrationImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive  = true
//		illustrationImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15).isActive             = true
//
//	}
//
//	@objc private func loginButtonTapped() {
//		navigationController?.pushViewController(LoginScreen(), animated: true)
//	}
//	@objc private func signInButtonTapped() {
//		navigationController?.pushViewController(SignupScreen(), animated: true)
//	}
//	private func isUserSignedIn() -> Bool {
//	  return Auth.auth().currentUser != nil
//	}
//}
//
//extension String {
//	func locaz() -> String {
//		return NSLocalizedString(self, tableName: "localized", bundle: .main, value: self, comment: self)
//	}
//
//
//}
//
//
//import UIKit
//
//extension UITextField {
//
//	open func setupTextField(with placeholder: NSAttributedString) {
//		backgroundColor = .clear
//		autocorrectionType = .no
//		layer.cornerRadius = 20
//		layer.borderWidth = 0.5
//		layer.borderColor = UIColor.white.cgColor
//		clipsToBounds = true
//		leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
//		leftViewMode = .always
//		attributedPlaceholder = placeholder
//		tintColor = .white
//		textColor = .white
//
//	}
//}
//
//extension UIButton {
//  open func setupButton(with title: String) {
//	backgroundColor = .black
//	setTitle(title, for: .normal)
//	setTitleColor(UIColor(#colorLiteral(red: 0.727360785, green: 0.9017360806, blue: 0.8943203092, alpha: 1)), for: .normal)
//	layer.cornerRadius = 20
//	clipsToBounds = true
//  }
//  open func setupButton(using image: String) {
//	setImage(UIImage(systemName: image)?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
//	backgroundColor = .clear
//	  layer.borderColor = UIColor( #colorLiteral(red: 0.727360785, green: 0.9017360806, blue: 0.8943203092, alpha: 1)).cgColor
//  }
//}
//
