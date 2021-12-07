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
		
		
		vc.restFromVC2 = cart[indexPath.row]
		
		
		self.navigationController?.pushViewController(vc, animated: true)
		
	}

	override func viewWillAppear(_ animated: Bool) {
 		super.viewWillAppear(animated)
 		self.tv.reloadData()
// 		print(data_Court_str.count)
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
		//========================================================================
		
	}
}

//	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		return cart.count
//	}


//	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourtVC_Cell_key", for: indexPath) as? CourtVC_Cell else {
//			return UICollectionViewCell()


//		}
//
//
//				cell.setCell(card:  data_Court_str[indexPath.row])
//
//
//				cell.deleteBtn.addTarget(self, action: #selector(deleteProduct), for: .touchUpInside)
//				cell.deleteBtn.tag = indexPath.row
//				cell.deleteBtn.isHidden = false
//

//		//
//		return cell
//	}

//
//		func deleteProduct(sender: UIButton) {
//		let alert = UIAlertController(title: "تحذير", message: "هل أنت متأكد من حذف المنتج من السلة ؟", preferredStyle: UIAlertController.Style.alert)
//
//
//		alert.addAction(UIAlertAction(title: "نعم", style: UIAlertAction.Style.default, handler: { action in
//
//			cart.remove(at: sender.tag)
//			self.tableView.reloadData()
//		}))
//
//		alert.addAction(UIAlertAction(title: "إلغاء", style: UIAlertAction.Style.destructive, handler: nil))
//
//		// show the alert
//		self.present(alert, animated: true, completion: nil)
//
//
//	}
//
//
//	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//		let vc = ServicePageVC()
//
//
//		vc.restFromVC2 = cart[indexPath.row]
//
//
//		self.navigationController?.pushViewController(vc, animated: true)
//
//	}
//
//
//
//	var collectionView: UICollectionView!
//	lazy var searchBar:UISearchBar = UISearchBar()
//
//		func viewDidLoad() {
//		super.viewDidLoad()
//
//
//		if #available(iOS 15, *) {
//			let appearance = UINavigationBarAppearance()
//			appearance.configureWithOpaqueBackground()
//			navigationController?.navigationBar.standardAppearance = appearance;
//			navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
//		}
//
//		self.navigationController?.navigationBar.topItem?.title = "Cart"
//
//
//		configureCollectionView()
//
//		view.backgroundColor = UIColor.systemGray6
//		self.navigationItem.largeTitleDisplayMode = .always
//
//		self.tableView.reloadData()
//		print(data_Court_str.count)
//	}
//
//
//	func addTapped() {
//		let vc = CartViewController()
//
//		self.navigationController?.pushViewController(vc, animated: true)
//	}
//
//
////	private func configureCollectionView(){
////		collectionView   = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: Layout())
////		collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
////		collectionView.backgroundColor = UIColor(named: "backgroundColor")
////		collectionView.delegate = self
////		collectionView.dataSource = self
////		collectionView.showsVerticalScrollIndicator = false
////		collectionView.register(CourtVC_Cell.self, forCellWithReuseIdentifier: "CourtVC_Cell_key")
////		view.addSubview(collectionView)
////	}
////	private func Layout() -> UICollectionViewCompositionalLayout{
////
////		let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
////
////		item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 19, bottom: 30, trailing: 19)
////
////		let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
////			widthDimension: .fractionalWidth(1),
////			heightDimension: .estimated(300)),subitems: [item])
////
////		let section = NSCollectionLayoutSection(group: group)
////
////
////		section.contentInsets.top = 25
////		return UICollectionViewCompositionalLayout(section: section)
////
////	}
////
////
////
//	}
//
//}
//
