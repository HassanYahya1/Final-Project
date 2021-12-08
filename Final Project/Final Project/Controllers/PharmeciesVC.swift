//
//  PharmeciesVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 03/05/1443 AH.
//


import UIKit

class Pharmacies: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
	
	
	lazy var searchBar:UISearchBar = UISearchBar()
	var users = pharmaciesData
	var search = false
	
	private var collectionView: UICollectionView?
	//==========================================================================
	
	override func viewDidLoad(){
		super.viewDidLoad()
		//		view.backgroundColor = UIColor (named: "")
		searchBar.searchBarStyle = UISearchBar.Style.default
		searchBar.placeholder = " Search..."
		searchBar.sizeToFit()
		searchBar.isTranslucent = false
		searchBar.backgroundImage = UIImage()
		searchBar.delegate = self
		navigationItem.titleView = searchBar
		view.backgroundColor = UIColor (named: "hassan")
		
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 1
		layout.sectionInset = UIEdgeInsets(top: 40,left: 10,bottom: 100,right: 10)
		layout.itemSize = CGSize(width: 180, height: 220)
		
		collectionView = UICollectionView(frame: .zero,
										  collectionViewLayout: layout)
		
		guard let collectionView = collectionView else {
			return
		}
		
		collectionView.register(PharmacyCell.self, forCellWithReuseIdentifier: PharmacyCell.identifier)
		collectionView.dataSource = self
		collectionView.delegate = self
		view.addSubview(collectionView)
		collectionView.frame = view.bounds
	}
	//==========================================================================
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->Int {
		
		return users.count
	}
	//==========================================================================
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
		
		let list = users[indexPath.row]
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PharmacyCell.identifier, for: indexPath) as! PharmacyCell
		
		cell.configure(label: "Custem\(indexPath.row)")
		
		cell.myImageView.image = list.image
		cell.name.text = list.name
		return cell
	}
	//==========================================================================
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		let data1 = pharmaciesData[indexPath.row]
		
		let VC1_CourtPageVC = ProductTV()
		VC1_CourtPageVC.imageCourtPage.image = data1.image
		VC1_CourtPageVC.nameCourtPage.text = data1.name
		VC1_CourtPageVC.productFromVC = data1
		
		navigationController?.pushViewController(VC1_CourtPageVC, animated: true)
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		if !searchText.isEmpty{
			
			search = true
			users.removeAll()
			for i in pharmaciesData {
				if i.name.lowercased().contains(searchText.lowercased()){
					users.append(i)
				}
			}
		}else{
			
			search = false
			users.removeAll()
			users = pharmaciesData
		}
		
		collectionView?.reloadData()
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		search = false
		users = pharmaciesData
		collectionView!.reloadData()
	}
}
