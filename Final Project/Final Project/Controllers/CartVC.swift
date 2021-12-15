//
//  CartVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 01/05/1443 AH.
//

import UIKit
var cart : Array <DiscProduct> = []
class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
	
	
	let imageCell = UIImageView()
	var tv = UITableView()
	lazy var btn: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setTitle(NSLocalizedString("End Your Shopping ✔︎" , comment: ""), for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.backgroundColor = UIColor(named: "LoginB")
		btn.tintColor = UIColor(named: "Tint")
		btn.layer.cornerRadius = 12
		btn.layer.masksToBounds = true
		btn.addTarget(self, action: #selector(payiny), for: .touchUpInside)
		btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
		return btn
	}()
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cart.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let pro = cart[indexPath.row]
		
		let cell = tableView.dequeueReusableCell(
			withIdentifier: "Service_Cell_key",
			for: indexPath
		)as! ProductCell
		
		cell.setCell(book: pro)
		
		cell.imageCell.image = UIImage(named: pro.imageA ?? "")
		cell.stalyCell.text = pro.staly
		cell.priceLbl.text = "\(pro.price)"
		return cell
	}
	var filteredData: [DiscProduct] = []
	var isFilter = true
	
	var products: [DiscProduct] = []
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tv.reloadData()
		
		// 		print(data_Court_str.count)
	}
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		if editingStyle == .delete {
			CartService.shared.deleteStudent(studentId: cart[indexPath.row].id)
			//			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		CartService.shared.listenToStudents {  cartFromFS in
			cart = cartFromFS
			self.tv.reloadData()
		}
		view.backgroundColor = UIColor(named: "BackG")
		tv.delegate = self
		tv.dataSource = self
		tv.rowHeight = 80
		tv.translatesAutoresizingMaskIntoConstraints = false
		tv.register(ProductCell.self, forCellReuseIdentifier: "Service_Cell_key")
		
		view.addSubview(tv)
		
		NSLayoutConstraint.activate([
			tv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tv.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
			tv.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			tv.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
			
		])
		view.addSubview(btn)
		btn.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			btn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
			btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 700)
			
		])
		
	}
	
	@objc func payiny() {
		let checkOut = CheckOut()
		present(checkOut, animated: true, completion: nil)
	}
	
}
