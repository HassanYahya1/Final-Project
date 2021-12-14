//
//  PharmeciesVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 03/05/1443 AH.
//


import UIKit

class Pharmacies: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, UICollectionViewDelegateFlowLayout {
	var currentCellIndex = 0
	var timer :Timer?
	var pageControl = UIPageControl()
	struct Home {
		var photo: UIImage
		
	}
	var arrCollecPhoto = [Home(photo: UIImage(named: "IMG_8660")!),
						  Home(photo: UIImage(named: "IMG_8661")!),
						  Home(photo: UIImage(named: "IMG_8662")!),
						  Home(photo: UIImage(named: "IMG_8663")!),
						  Home(photo: UIImage(named: "IMG_8664")!),
						  Home(photo: UIImage(named: "IMG_8665")!),
						  Home(photo: UIImage(named: "IMG_8667")!),

	]
	
	let collectionView1: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//		cv.backgroundColor = .brown
//		UIColor(
//			displayP3Red: 246/255, green:  246/255, blue: 238/255, alpha: 1)
		return cv
	}()
	
	lazy var searchBar:UISearchBar = UISearchBar()
	var users = pharmaciesData
	var search = false
	
	private var collectionView: UICollectionView!
	//==========================================================================
	
	func setupCollectionConstraints() {
		collectionView1.translatesAutoresizingMaskIntoConstraints = false
		collectionView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
		collectionView1.heightAnchor.constraint(equalToConstant: 200).isActive = true
		collectionView1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		collectionView1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
	}
	
	override func viewDidLoad(){
		super.viewDidLoad()
		searchBar.delegate = self
		pageControl.numberOfPages = arrCollecPhoto.count
		startTimer()
		
		view.backgroundColor = UIColor(named: "BackG")
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 1
		layout.sectionInset = UIEdgeInsets(top: 200,left: 10,bottom: 100,right: 10)
		layout.itemSize = CGSize(width: 180, height: 220)
		
		pageControl.translatesAutoresizingMaskIntoConstraints = false
//		pageControl.backgroundColor = .brown
		view.addSubview(pageControl)
		NSLayoutConstraint.activate([
			pageControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
			pageControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -100),
			pageControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 100),
			pageControl.heightAnchor.constraint(equalToConstant: 26),
			pageControl.widthAnchor.constraint(equalToConstant: 150),

		])
		
		collectionView = UICollectionView(frame: .zero,
										  collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(collectionView)
		view.addSubview(collectionView1)

		collectionView.register(PharmacyCell.self, forCellWithReuseIdentifier: PharmacyCell.identifier)
		collectionView.dataSource = self
		collectionView.delegate = self
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 30),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
			collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
		])
		
		
		//		view.backgroundColor = UIColor (named: "")
		searchBar.searchBarStyle = UISearchBar.Style.default
		searchBar.placeholder = " Search..."
		searchBar.sizeToFit()
//		searchBar.isTranslucent = false
//		searchBar.backgroundImage = UIImage()
		searchBar.delegate = self
		navigationItem.titleView = searchBar
//		view.backgroundColor = UIColor (named: "hassan")
		
		//------------
		collectionView1.delegate = self
		collectionView1.dataSource = self
		collectionView1.register(collectionViewCell.self, forCellWithReuseIdentifier: collectionViewCell.identfire)
		setupCollectionConstraints()
		
	}
	@objc func moveToNextIndex(){
			if currentCellIndex < arrCollecPhoto.count - 1{
				currentCellIndex += 1
			}else{
				currentCellIndex = 0
			}
			
		   
			collectionView1.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
			pageControl.currentPage = currentCellIndex
		}
	func startTimer() {
			timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
			
		}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return .init(top: 12, left: 12, bottom: 12, right: 12)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 12
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 12
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if collectionView === collectionView1 {
			return CGSize(width: 200, height: 200)
		}
		
		return CGSize(width: (UIScreen.main.bounds.size.width - 36)/2, height: 200)
	}
	//==========================================================================
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->Int {
		if collectionView === collectionView1{
			return arrCollecPhoto.count
		}
		return users.count
	}
	
	//==========================================================================
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
		
		if collectionView === collectionView1 {
			
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCell.identfire, for: indexPath) as! collectionViewCell
			
			let data = arrCollecPhoto[indexPath.row]
			
			cell.imageC.image = data.photo
//			cell.backgroundColor = .yellow
			return cell
		}
		
		let list = users[indexPath.row]
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PharmacyCell.identifier, for: indexPath) as! PharmacyCell
		
		cell.configure(label: "Custem\(indexPath.row)")
		
		cell.myImageView.image = list.image
		cell.name.text = list.name
		return cell
	}
	//==========================================================================
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if collectionView === collectionView1 {
			return
		}
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
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		searchBar.resignFirstResponder()
		return true
	}
}

