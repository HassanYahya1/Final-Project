//
//  checkOutVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 05/05/1443 AH.
//
import UIKit

class CheckOut: UIViewController, UITextFieldDelegate {
	
	
	var wellcomeLab = UILabel()
	var nameTF = UITextField()
	var addresTF = UITextField()
	var numberTF = UITextField()
	var okbtn = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		nameTF.delegate = self
		numberTF.delegate = self
		addresTF.delegate = self
		
		view.backgroundColor = UIColor(named: "Addcart")
		wellcomeLab.translatesAutoresizingMaskIntoConstraints = false
		//		wellcomeLab.backgroundColor = .white
		wellcomeLab.textColor = UIColor(named: "Tint")
		wellcomeLab.textAlignment = .center
		wellcomeLab.font = UIFont.systemFont(ofSize: 30, weight: .bold)
		wellcomeLab.text = NSLocalizedString("Thank you for your trust", comment: "")
		view.addSubview(wellcomeLab)
		NSLayoutConstraint.activate([
			wellcomeLab.topAnchor.constraint(equalTo: view.topAnchor,constant: 25),
			wellcomeLab.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			wellcomeLab.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
			
		])
		nameTF.translatesAutoresizingMaskIntoConstraints = false
		nameTF.layer.cornerRadius = 12
		nameTF.layer.borderWidth = 1
		nameTF.layer.borderColor = UIColor.lightGray.cgColor
		nameTF.placeholder = NSLocalizedString("First Name", comment: "")
		nameTF.backgroundColor = UIColor(named: "Cell")
		nameTF.textColor = UIColor(named: "Tint")
		nameTF.textAlignment = .center
		
		//		   nameTF.text = "Hassan@gmail.com"
		view.addSubview(nameTF)
		NSLayoutConstraint.activate([
			nameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			nameTF.topAnchor.constraint(equalTo: wellcomeLab.bottomAnchor, constant: 350),
			nameTF.widthAnchor.constraint(equalToConstant: 350),
			nameTF.heightAnchor.constraint(equalToConstant: 40),
		])
		
		addresTF.translatesAutoresizingMaskIntoConstraints = false
		addresTF.layer.cornerRadius = 12
		addresTF.layer.borderWidth = 1
		addresTF.layer.borderColor = UIColor.lightGray.cgColor
		addresTF.placeholder = NSLocalizedString("Your Address", comment: "")
		addresTF.textAlignment = .center
		addresTF.backgroundColor = UIColor(named: "Cell")
		addresTF.textColor = UIColor(named: "Tint")
		view.addSubview(addresTF)
		NSLayoutConstraint.activate([
			addresTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			addresTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 16),
			addresTF.widthAnchor.constraint(equalToConstant: 350),
			addresTF.heightAnchor.constraint(equalToConstant: 40),
		])
		
		numberTF.translatesAutoresizingMaskIntoConstraints = false
		numberTF.layer.cornerRadius = 12
		numberTF.layer.borderWidth = 1
		numberTF.layer.borderColor = UIColor.lightGray.cgColor
		numberTF.placeholder = NSLocalizedString("Your Number", comment: "")
		numberTF.textAlignment = .center
		numberTF.backgroundColor = UIColor(named: "Cell")
		numberTF.textColor = UIColor(named: "Tint")
		//		  numberTF.text = "123123"
		view.addSubview(numberTF)
		NSLayoutConstraint.activate([
			numberTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
			numberTF.topAnchor.constraint(equalTo: addresTF.bottomAnchor, constant: 16),
			numberTF.widthAnchor.constraint(equalToConstant: 350),
			numberTF.heightAnchor.constraint(equalToConstant: 40),
		])
		
		okbtn.translatesAutoresizingMaskIntoConstraints = false
		okbtn.setTitle(NSLocalizedString("Check Out 💵", comment: ""), for: .normal)
		okbtn.setTitleColor(.white , for: .normal)
		okbtn.backgroundColor = UIColor(named: "LoginB")
		okbtn.tintColor = UIColor(named: "Cell")
		okbtn.layer.cornerRadius = 12
		okbtn.layer.masksToBounds = true
		okbtn.addTarget(self, action: #selector(popupAlert2), for: .touchUpInside)
		okbtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
		view.addSubview(okbtn)
		NSLayoutConstraint.activate([
			okbtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45),
			okbtn.topAnchor.constraint(equalTo: numberTF.bottomAnchor, constant: 30),
			okbtn.widthAnchor.constraint(equalToConstant: 300),
			okbtn.heightAnchor.constraint(equalToConstant: 40),
		])
	}
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		nameTF.resignFirstResponder()
		numberTF.resignFirstResponder()
		addresTF.resignFirstResponder()
		return true
	}
	@objc func popupAlert2(sender: UIButton!){
		
		let alert = UIAlertController(title: NSLocalizedString("The products will be delivered to your address within 3-4 working days and payment will be upon receipt. Thank you for your shopping 🛍🖤", comment: ""),
									  message: "",
									  preferredStyle: .alert)
		
		alert.addAction(UIAlertAction(title: NSLocalizedString("Done", comment: ""), style: .default, handler: { action in
			self.dismiss(animated: true, completion: nil)
			
		}))
		self.present(alert, animated: true)
		
	}
}
