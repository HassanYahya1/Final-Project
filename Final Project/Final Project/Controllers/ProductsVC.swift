//
//  ProductsVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 03/05/1443 AH.
//

import UIKit

class ProductTV: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var productFromVC: PharmacyStruct?
	
	let imageCourtPage = UIImageView()
	let nameCourtPage = UILabel()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor =  UIColor(named: "BackG")

//		view.backgroundColor = UIColor (named: "myBackgroundColor2")
		
		imageCourtPage.translatesAutoresizingMaskIntoConstraints = false
		nameCourtPage.translatesAutoresizingMaskIntoConstraints = false
		
		let TVs = UITableView()
		
		TVs.dataSource = self
		TVs.delegate = self
		TVs.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
		TVs.rowHeight = 80
		TVs.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(TVs)
		
		NSLayoutConstraint.activate([
			TVs.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			TVs.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			TVs.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			TVs.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
			
		])
	}
	//---------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return productFromVC?.discProduct.count ?? 0
	}
	//--------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let list = productFromVC!.discProduct[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
		
		cell.imageCell.image = UIImage(named: list.imageA!)
		cell.nameCell.text = list.nameA
		cell.priceLbl.text = "\(list.price)"
		cell.setCell(book: list)
//		cell.favButton.setImage(UIImage(named: "like"), for: .normal)
		
		return cell
	}
	//--------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		tableView.reloadData()
		
		let data2 = productFromVC!.discProduct[indexPath.row]
		
		let VC2_ServicePageVC = ProductDiscrebtion()
		VC2_ServicePageVC.imageBlogPage.image = UIImage(named: data2.imageA!)
		VC2_ServicePageVC.nameBlogPage.text = data2.nameA
		VC2_ServicePageVC.textBlogPage.text = data2.summaryA
		VC2_ServicePageVC.ProductFromVC2 = data2
		
		
		navigationController?.pushViewController(VC2_ServicePageVC, animated: true)
	}
}
