//
//  LoginVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 03/05/1443 AH.
//
//

import UIKit
import FirebaseAuth


class RegisterVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
	
	var users: Array<User> = []
	
	lazy var profileImage: UIImageView = {
	   let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.backgroundColor = .white
		image.isUserInteractionEnabled = true
		image.layer.cornerRadius = 25

	   return image
   }()
	lazy var imagePicker : UIImagePickerController = {
	   let imagePicker = UIImagePickerController()
	   imagePicker.delegate = self
	   imagePicker.sourceType = .photoLibrary
	   imagePicker.allowsEditing = true

	   return imagePicker
   }()
	
	lazy var firstName: UITextField = {
	  let firstName = UITextField()
		firstName.translatesAutoresizingMaskIntoConstraints = false
		firstName.layer.cornerRadius = 12
		firstName.layer.borderWidth = 1
		firstName.layer.borderColor = UIColor.lightGray.cgColor
		firstName.placeholder = " First Name..."
		firstName.backgroundColor = .secondarySystemBackground
	  return firstName
  }()
	
	lazy var lastName: UITextField = {
	  let lastName = UITextField()
		lastName.translatesAutoresizingMaskIntoConstraints = false
		lastName.layer.cornerRadius = 12
		lastName.layer.borderWidth = 1
		lastName.layer.borderColor = UIColor.lightGray.cgColor
		lastName.placeholder = "  Last Name..."
		lastName.backgroundColor = .secondarySystemBackground
	  return lastName
  }()
	  lazy var userEmail: UITextField = {
		let userEmail = UITextField()
		  userEmail.translatesAutoresizingMaskIntoConstraints = false
		  userEmail.layer.cornerRadius = 12
		  userEmail.layer.borderWidth = 1
		  userEmail.layer.borderColor = UIColor.lightGray.cgColor
		  userEmail.placeholder = "  Email Address..."
		  userEmail.backgroundColor = .secondarySystemBackground
		return userEmail
	}()

	private let userPassword: UITextField = {
		let userPassword = UITextField()
		userPassword.translatesAutoresizingMaskIntoConstraints = false
		userPassword.layer.cornerRadius = 12
		userPassword.layer.borderWidth = 1
		userPassword.layer.borderColor = UIColor.lightGray.cgColor
		userPassword.isSecureTextEntry = true
		userPassword.placeholder = "  Password..."
		userPassword.backgroundColor = .secondarySystemBackground
		return userPassword
	}()

	private let registerButton: UIButton = {
		let registerButton = UIButton()
		registerButton.translatesAutoresizingMaskIntoConstraints = false
		registerButton.setTitle("Register", for: .normal)
		registerButton.setTitleColor(.black, for: .normal)
		registerButton.backgroundColor = .systemTeal
		registerButton.layer.cornerRadius = 12
		registerButton.layer.masksToBounds = true
		registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
		registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
		return registerButton
	}()
	
	lazy var labelToRegister: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.backgroundColor = .white
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
		label.text = "did you have account? "
		return label
	  }()
	  lazy var logInButton: UIButton = {
		let logInBtn = UIButton()
		logInBtn.translatesAutoresizingMaskIntoConstraints = false
		logInBtn.setTitle("Sign in", for: .normal)
		logInBtn.setTitleColor(.blue, for: .normal)
		logInBtn.backgroundColor = .white
		logInBtn.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
		logInBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
		return logInBtn
	  }()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		RegisterService.shared.listenToUsers { newUsers in
			self.users = newUsers
		}
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
		 profileImage.addGestureRecognizer(tapRecognizer)
		
		view.backgroundColor = .white
		title = "Register"
		
		
		//Constraint firstName
		view.addSubview(profileImage)
		NSLayoutConstraint.activate([
			profileImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -145),
			profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
			profileImage.widthAnchor.constraint(equalToConstant: 100),
			profileImage.heightAnchor.constraint(equalToConstant: 100),
		])
		view.addSubview(firstName)
		NSLayoutConstraint.activate([
			firstName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			firstName.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 350),
			firstName.widthAnchor.constraint(equalToConstant: 350),
			firstName.heightAnchor.constraint(equalToConstant: 40),
		])
		
		//Constraint lastName
		view.addSubview(lastName)
		NSLayoutConstraint.activate([
			lastName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 16),
			lastName.widthAnchor.constraint(equalToConstant: 350),
			lastName.heightAnchor.constraint(equalToConstant: 40),
		])
		//Constraint userEmail
		view.addSubview(userEmail)
		NSLayoutConstraint.activate([
			userEmail.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			userEmail.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 16),
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
		view.addSubview(registerButton)
		NSLayoutConstraint.activate([
			registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
			registerButton.topAnchor.constraint(equalTo: userPassword.bottomAnchor, constant: 16),
			registerButton.widthAnchor.constraint(equalToConstant: 300),
			registerButton.heightAnchor.constraint(equalToConstant: 40),
		])
		
		view.addSubview(labelToRegister)
			NSLayoutConstraint.activate([
			  labelToRegister.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
			  labelToRegister.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
			  labelToRegister.widthAnchor.constraint(equalToConstant: 300),
			  labelToRegister.heightAnchor.constraint(equalToConstant: 40),
			])
			//Constraint LogInButton
			view.addSubview(logInButton)
			NSLayoutConstraint.activate([
			  logInButton.rightAnchor.constraint(equalTo: labelToRegister.leftAnchor, constant: 200),
			  logInButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
			  logInButton.widthAnchor.constraint(equalToConstant: 50),
			  logInButton.heightAnchor.constraint(equalToConstant: 40),
			])
		
  
	}
	
	@objc private func registerButtonTapped() {
		
		// linke with firebase
		let email = userEmail.text ?? ""
		let password = userPassword.text ?? ""
		let firstNam = firstName.text ?? ""
		let lastNam = lastName.text ?? ""
		let image = profileImage.image
		
		if email.isEmpty || password.isEmpty || firstNam.isEmpty || lastNam.isEmpty {
			return
		}
		Auth.auth().createUser(withEmail: email, password: password) { result, error in
			if error != nil {
				print(error as Any)
				return
			}
		}
		
		guard let userId = Auth.auth().currentUser?.uid else { return }
		RegisterService.shared.addUser(
			user: User(id: userId, name: firstNam,status: "busy", image: "gs://snapapp-e0267.appspot.com", location: "")
		)
		//open TabVC bage
		let vc = TabVC()
		vc.modalPresentationStyle = .fullScreen
		self.present(vc, animated: true, completion: nil)
	}
	
// image picker in register page
  @objc func imageTapped() {
	print("Image tapped")
	  present(imagePicker, animated: true)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
	let image = info[.editedImage] ?? info [.originalImage] as? UIImage
	  profileImage.image = image as? UIImage
	dismiss(animated: true)
  }
	
	@objc private func logInButtonTapped() {
		let vc = LogInVC()
		vc.modalPresentationStyle = .fullScreen
		self.present(vc, animated: true, completion: nil)
	  }
}

import UIKit
import FirebaseFirestore

class RegisterService {
	
	static let shared = RegisterService()
	
	let usersCollection = Firestore.firestore().collection("users")
	
	// Add user to firestor
	func addUser(user: User) {
		usersCollection.document(user.id).setData([
			"name": user.name,
			"id": user.id,
			"image": user.image,
			"status": user.status,
			"location" : user.location
		])
	}
	
	func listenToUsers(completion: @escaping (([User]) -> Void)) {
		
		usersCollection.addSnapshotListener { snapshot, error in
			if error != nil { // if there's any error
				return
			}
			guard let documents = snapshot?.documents else { return }
			
			var users: Array<User> = []
			for document in documents {
				let data = document.data()
				let user = User(
					id: (data["id"] as? String) ?? "No id",
					name: (data["name"] as? String) ?? "No name",
					status: (data["status"] as? String ?? "No status"),
					image: (data["image"] as? String ?? "No image"),
					location: (data["status"] as? String ?? "No status")
				)
				users.append(user)
			}
			
			completion(users)
		}
	}
	func updateUserInfo(user: User) {
		usersCollection.document(user.id).setData([
			"id": user.id,
			"name": user.name,
			"image": user.image,
			"status": user.status,
		], merge: true)
	}

}

//import UIKit
//import FirebaseAuth
//import FirebaseFirestore
//
//class LoginScreen: UIViewController {
//
//	let db = Firestore.firestore()
//
//	let containerView: UIView = {
//		let view = UIView()
//		view.backgroundColor = UIColor(#colorLiteral(red: 0.9256234765, green: 0.7424535155, blue: 0.8250460029, alpha: 1))
//		view.layer.borderWidth = 0.25
//		view.layer.borderColor = UIColor.white.cgColor
//		view.layer.cornerRadius = 20
//		view.clipsToBounds = true
//		return view
//	}()
//
//	let illustrationImage: UIImageView = {
//		let image = UIImageView()
//		image.image = UIImage(named: "signup")
//		image.contentMode = .scaleAspectFill
//		image.clipsToBounds = true
//		return image
//	}()
//
//	let titleLabel: UILabel = {
//		let title = UILabel()
//		title.backgroundColor = .clear
//		title.text = "Welcome back!"
//		title.font = UIFont.systemFont(ofSize: 29, weight: .bold)
//		title.textColor = UIColor(#colorLiteral(red: 0.9175770879, green: 0.7899500132, blue: 0.8629837036, alpha: 1))
//		title.textAlignment = .center
//		title.numberOfLines = 0
//		return title
//	}()
//
//
//	let emailTextField: UITextField = {
//		let textField = UITextField()
//		textField.setupTextField(with: NSAttributedString(string: "Email",
//														  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]))
//		return textField
//	}()
//	let passwordTextField: UITextField = {
//		let textField = UITextField()
//
//		textField.setupTextField(with: NSAttributedString(string: "Password",
//														  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]))
//		textField.isSecureTextEntry = true
//		return textField
//	}()
//
//	let createAccountButton: UIButton = {
//		let button = UIButton(type: .system)
//		button.setupButton(with: "Log in")
//		return button
//	}()
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		view.backgroundColor = UIColor(#colorLiteral(red: 0.727360785, green: 0.9017360806, blue: 0.8943203092, alpha: 1))
//		setupViews()
//	}
//
//	private func setupViews() {
//		containerView.translatesAutoresizingMaskIntoConstraints = false
//
//		view.addSubview(containerView)
//
//		containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
//		containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
//		containerView.widthAnchor.constraint(equalToConstant: 325).isActive                                         = true
//		containerView.heightAnchor.constraint(equalToConstant: 415).isActive                                        = true
//
//
//		createAccountButton.translatesAutoresizingMaskIntoConstraints = false
//
//		createAccountButton.addTarget(self, action: #selector(loginUserTapped), for: .touchUpInside)
//
//		containerView.addSubview(createAccountButton)
//
//		createAccountButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
//		createAccountButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
//		createAccountButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
//		createAccountButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
//
//
//
//		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
//		passwordTextField.delegate = self
//		containerView.addSubview(passwordTextField)
//
//		passwordTextField.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: -15).isActive = true
//		passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
//		passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
//		passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
//
//
//		emailTextField.translatesAutoresizingMaskIntoConstraints = false
//		emailTextField.delegate = self
//		containerView.addSubview(emailTextField)
//
//		emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -5).isActive = true
//		emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
//		emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
//		emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
//
//
//
//		titleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//		containerView.addSubview(titleLabel)
//
//		titleLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -5).isActive = true
//		titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
//		titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
//
//
//		illustrationImage.translatesAutoresizingMaskIntoConstraints = false
//
//		containerView.addSubview(illustrationImage)
//
//		illustrationImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0).isActive             = true
//		illustrationImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive     = true
//		illustrationImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive  = true
//		illustrationImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive             = true
//
//	}
//
//	@objc private func loginUserTapped() {
//		guard let email = emailTextField.text else {return}
//		guard let password = passwordTextField.text else {return}
//
//		if !email.isEmpty && !password.isEmpty {
//			loginUsing(email: email, password: password)
//		}else{
//			let alert = UIAlertController(title: "Oops!", message: "please make sure email and password are not empty.", preferredStyle: .alert)
//
//			alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//
//			present(alert, animated: true)
//		}
//
//	}
//	private func loginUsing(email: String, password: String) {
//		Auth.auth().signIn(withEmail: email, password: password) { results, error in
//
//			if let error = error as NSError? {
//				switch AuthErrorCode(rawValue: error.code) {
//				case .wrongPassword:
//
//					let alert = UIAlertController(title: "Oops!", message: "you entered a wrong password", preferredStyle: .alert)
//					alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//					self.present(alert, animated: true)
//
//				case .invalidEmail:
//
//					let alert = UIAlertController(title: "Oops!", message: "are sure you typed the email correctly?", preferredStyle: .alert)
//					alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//					self.present(alert, animated: true)
//
//				case .weakPassword:
//
//					let alert = UIAlertController(title: "Oops!", message: "Your password is weak, please make sure it's strong.", preferredStyle: .alert)
//					alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//					self.present(alert, animated: true)
//
//				default:
//
//					let alert = UIAlertController(title: "Oops!", message: "\(error.localizedDescription)", preferredStyle: .alert)
//					alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//					self.present(alert, animated: true)
//
//				}
//			}else{
//
//				guard let user = results?.user else {return}
//
//				self.db.collection("profiles").document(user.uid).setData([
//					"emai": String(user.email!),
//					"userID": user.uid,
//					"status": "yes"
//				], merge: true) { err in
//					if let err = err {
//						print("Error writing document: \(err)")
//					} else {
//						print("Document successfully written!")
//					}
//				}
//
//				let vc = TabVC()
//				let nav = UINavigationController()
//				nav.viewControllers = [vc]
//				nav.modalPresentationStyle = .fullScreen
//				nav.modalTransitionStyle = .flipHorizontal
//				self.present(nav, animated: true, completion: nil)
//
////       self.navigationController?.pushViewController(StoreTabBar(),animated: true)
//
////                self.navigationController?.popToRootViewController(animated: true)
////                self.navigationController?.pushViewController(StoreTabBar(),animated: true)
//			}
//
//
//		}
//	}
//
//}
//
//
//
//extension LoginScreen: UITextFieldDelegate {
//	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//		emailTextField.resignFirstResponder()
//		passwordTextField.resignFirstResponder()
//
//		return true
//	}
//}
//
