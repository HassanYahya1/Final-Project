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
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cart.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let pro = cart[indexPath.row]
		
		let cell = tableView.dequeueReusableCell(
			withIdentifier: "Service_Cell_key",
			for: indexPath
		)as! ProductCell
		
		cell.nameCell.text = pro.nameA
		cell.imageCell.image = pro.imageA
		cell.stalyCell.text = pro.staly
		return cell
	}
	var filteredData: [DiscProduct] = []
	var isFilter = true
	
	var products: [DiscProduct] = []
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = ProductDiscrebtion()
		
		
		vc.ProductFromVC2 = cart[indexPath.row]
		
		
		self.navigationController?.pushViewController(vc, animated: true)
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tv.reloadData()
		// 		print(data_Court_str.count)
	}
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		if editingStyle == .delete {
			cart.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)        }
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		tv.delegate = self
		tv.dataSource = self
		tv.rowHeight = 80
		tv.translatesAutoresizingMaskIntoConstraints = false
		tv.register(ProductCell.self, forCellReuseIdentifier: "Service_Cell_key")
		
		view.addSubview(tv)
		
		NSLayoutConstraint.activate([
			tv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tv.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tv.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			tv.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
			
		])
		
	}
}
