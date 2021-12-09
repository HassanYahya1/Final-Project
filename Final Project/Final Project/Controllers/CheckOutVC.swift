//
//  checkOutVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 05/05/1443 AH.
//

import UIKit
class CheckOut: UIViewController{
	
	var wellcomeLab = UILabel()
	var nameTF = UITextField()
	var addresTF = UITextField()
	var numberTF = UITextField()
	var okbtn = UIButton()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemGray
		wellcomeLab.translatesAutoresizingMaskIntoConstraints = false
//		wellcomeLab.backgroundColor = .white
		wellcomeLab.textColor = .black
		wellcomeLab.textAlignment = .center
		wellcomeLab.font = UIFont.systemFont(ofSize: 30, weight: .bold)
		wellcomeLab.text = "Most Wellcome"
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
		 nameTF.placeholder = "Write Your Name"
		 nameTF.backgroundColor = .secondarySystemBackground
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
		addresTF.placeholder = "Write Your Address"
		addresTF.textAlignment = .center
		addresTF.backgroundColor = .secondarySystemBackground
//		  addresTF.text = "123123"
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
		numberTF.placeholder = "Write Your Phone Number"
		numberTF.textAlignment = .center
		numberTF.backgroundColor = .secondarySystemBackground
//		  numberTF.text = "123123"
		view.addSubview(numberTF)
		NSLayoutConstraint.activate([
		  numberTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
		  numberTF.topAnchor.constraint(equalTo: addresTF.bottomAnchor, constant: 16),
		  numberTF.widthAnchor.constraint(equalToConstant: 350),
		  numberTF.heightAnchor.constraint(equalToConstant: 40),
		])
		
		okbtn.translatesAutoresizingMaskIntoConstraints = false
		okbtn.setTitle("Check Out", for: .normal)
		okbtn.setTitleColor(.black, for: .normal)
		okbtn.backgroundColor = .systemTeal
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
	
	@objc func popupAlert2(sender: UIButton!){
         
		let alert = UIAlertController(title: "Congratulations 🎉 ! your purchases are free, Thank you for your shopping at Modern Shopping . ",
									  message: "",
									  preferredStyle: .alert)
		
		alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
		}))
		self.present(alert, animated: true)
	}
}
