////
////  Pharmacies.swift
////  Final Project
////
////  Created by Hassan Yahya on 01/05/1443 AH.
////
////
//
//import UIKit
//
//class Pharmacies: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
//	private var collectionView: UICollectionView?
//	//==========================================================================
//	override func viewDidLoad(){
//		super.viewDidLoad()
//
//		view.backgroundColor = UIColor (named: "myBackgroundColor2")
//
//		let layout = UICollectionViewFlowLayout()
//		layout.scrollDirection = .vertical
//		layout.minimumLineSpacing = 10
//		layout.minimumInteritemSpacing = 1
//		layout.sectionInset = UIEdgeInsets(top: 20,left: 10,bottom: 100,right: 10)
//		layout.itemSize = CGSize(width: 180, height: 220)
//
//		collectionView = UICollectionView(frame: .zero,
//										  collectionViewLayout: layout)
//
//		guard let collectionView = collectionView else {
//			return
//		}
//
//		collectionView.register(PharmacyCell.self, forCellWithReuseIdentifier: PharmacyCell.identifier)
//		collectionView.dataSource = self
//		collectionView.delegate = self
//		view.addSubview(collectionView)
//		collectionView.frame = view.bounds
//	}
//	//==========================================================================
//	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->Int {
//
//		return data_Pharmacy_str.count
//	}
//	//==========================================================================
//	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//
//		let list = data_Pharmacy_str[indexPath.row]
//
//		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PharmacyCell.identifier, for: indexPath) as! PharmacyCell
//
//		cell.configure(label: "Custem\(indexPath.row)")
//
//		cell.myImageView.image = list.image
//		cell.name.text = list.name
//		return cell
//	}
//	//==========================================================================
//	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//		let data1 = data_Pharmacy_str[indexPath.row]
//
//		let VC1_CourtPageVC = ProductTV()
//		VC1_CourtPageVC.imageCourtPage.image = data1.image
//		VC1_CourtPageVC.nameCourtPage.text = data1.name
//		VC1_CourtPageVC.restFromVC = data1
//
//		navigationController?.pushViewController(VC1_CourtPageVC, animated: true)
//	}
//}
////==========================================================================
//
//
//
////
////  CourtVC_Cell.swift
////  Fawaz solo project
////
////  Created by Fawaz on 29/11/2021.
////
//
//import UIKit
//
//class PharmacyCell: UICollectionViewCell {
//
//	static let identifier = "CourtVC_Cell_key"
//
//	//==========================================================================
//	let staly: UILabel = {
//		let staly = UILabel()
//		staly.textColor = .label
//		staly.layer.cornerRadius = 40
//		staly.clipsToBounds = true
//		staly.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//
//		return staly
//	}()
//	//==========================================================================
//	let myImageView: UIImageView = {
//		let imageView = UIImageView()
//		imageView.contentMode = .scaleAspectFit
//		imageView.tintColor = .label
//		imageView.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//
//		return imageView
//	}()
//	//==========================================================================
//	let name: UILabel = {
//		let label = UILabel()
//		label.textColor = .label
//		label.numberOfLines = 0
//		label.textAlignment = .center
//		label.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//
//		return label
//	}()
//	//==========================================================================
//	override init (frame: CGRect) {
//		super.init(frame: frame)
//
//		contentView.addSubview(staly)
//		contentView.addSubview(myImageView)
//		contentView.addSubview(name)
//		contentView.clipsToBounds = true
//	}
//	//==========================================================================
//	required init?(coder: NSCoder) {
//		fatalError( "init(coder:) has not been implemented")
//	}
//	//==========================================================================
//	override func layoutSubviews() {
//		super.layoutSubviews()
//
//		staly.frame = CGRect(x: 0,
//							 y: 0,
//							 width: contentView.frame.size.height-40,
//							 height: contentView.frame.size.height-0)
//
//		myImageView.frame = CGRect(x: 10,
//								   y: 15,
//								   width: 160,
//								   height: 140)
//
//		name.frame = CGRect(x: 10,
//							y: 160,
//							width: 160,
//							height: 45)
//
//	}
//	//==========================================================================
//	public func configure(label: String) {
//		name.text = label
//	}
//	//==========================================================================
//	override func prepareForReuse() {
//		super.prepareForReuse()
//		name.text = nil
//	}
//
//}
////==========================================================================
//
////
////  CourtPageVC.swift
////  Fawaz solo project
////
////  Created by Fawaz on 28/11/2021.
////
////    عرض المنتجات
//import UIKit
//
//class ProductTV: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//	var restFromVC: PharmacyStruct?
//
//	let imageCourtPage = UIImageView()
//	let nameCourtPage = UILabel()
//	//  let summaryCourtPage = UILabel()
//	//==========================================================================
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//		view.backgroundColor = UIColor (named: "myBackgroundColor2")
//
//		imageCourtPage.translatesAutoresizingMaskIntoConstraints = false
//		nameCourtPage.translatesAutoresizingMaskIntoConstraints = false
//
//		let TVs = UITableView()
//
//		TVs.dataSource = self
//		TVs.delegate = self
//		TVs.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
//		TVs.rowHeight = 80
//		TVs.translatesAutoresizingMaskIntoConstraints = false
//
//		view.addSubview(TVs)
//
//		NSLayoutConstraint.activate([
//			TVs.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//			TVs.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//			TVs.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//			TVs.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
//
//		])
//
//	}
//	//======================================================================
//	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//		return restFromVC?.discProduct.count ?? 0
//	}
//	//======================================================================
//	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//		let list = restFromVC!.discProduct[indexPath.row]
//		let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
//
//		cell.imageCell.image = list.imageA
//		cell.nameCell.text = list.nameA
//
//		return cell
//	}
//	//======================================================================
//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		//    data_Court_str
//
//		tableView.reloadData()
//
//		let data2 = restFromVC!.discProduct[indexPath.row]
//
//		let VC2_ServicePageVC = ProductDiscrebtion()
//		VC2_ServicePageVC.imageBlogPage.image = data2.imageA
//		VC2_ServicePageVC.nameBlogPage.text = data2.nameA
//		VC2_ServicePageVC.textBlogPage.text = data2.summaryA
//		VC2_ServicePageVC.restFromVC2 = data2
//
//		navigationController?.pushViewController(VC2_ServicePageVC, animated: true)
//		//    self.present(VC2_LawyersPageVC, animated: true, completion: nil)
//
//	}
//}
////==========================================================================
//
////
////  Service_Cell.swift
////  Fawaz solo project
////
////  Created by Fawaz on 29/11/2021.
////
//
////data_Court_str
//import UIKit
//
//class ProductCell: UITableViewCell {
//
//	static let identifier = "Service_Cell_key"
//
//	let imageCell = UIImageView()
//	let nameCell = UILabel()
//	let stalyCell = UILabel()
//
//	//==========================================================================
//	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
//
//		super.init(style: style , reuseIdentifier: reuseIdentifier)
//		//========================================================================
//		imageCell.translatesAutoresizingMaskIntoConstraints = false
//		self.addSubview(imageCell)
//		imageCell.contentMode = .scaleAspectFit
//		imageCell.tintColor = .label
//		imageCell.layer.masksToBounds = true
//		imageCell.layer.cornerRadius = 10
//		imageCell.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//
//		NSLayoutConstraint.activate([
//			imageCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
//			imageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
//			imageCell.heightAnchor.constraint(equalToConstant: 50),
//			imageCell.widthAnchor.constraint(equalToConstant: 50)
//		])
//		//========================================================================
//		stalyCell.font = UIFont.systemFont(ofSize: 20)
//		stalyCell.numberOfLines = 0
//		stalyCell.textColor = .label
//		stalyCell.translatesAutoresizingMaskIntoConstraints = false
//		stalyCell.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//		stalyCell.layer.cornerRadius = 10
//		stalyCell.clipsToBounds = true
//
//		self.addSubview(stalyCell)
//
//		NSLayoutConstraint.activate([
//			stalyCell.centerYAnchor.constraint(equalTo: centerYAnchor),
//			stalyCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
//			stalyCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -5),
//			stalyCell.heightAnchor.constraint(equalToConstant: 50)
//
//		])
//		//========================================================================
//		nameCell.translatesAutoresizingMaskIntoConstraints = false
//		self.addSubview(nameCell)
//
//		nameCell.textColor = .label
//		nameCell.textAlignment = .right
//		nameCell.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//		nameCell.font = UIFont.systemFont(ofSize: 20)
//
//		NSLayoutConstraint.activate([
//			nameCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -15),
//			nameCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
//			//      nameCell.topAnchor.constraint(equalTo: topAnchor, constant: 20),
//			nameCell.centerYAnchor.constraint(equalTo: centerYAnchor),
//			nameCell.heightAnchor.constraint(equalToConstant: 45)
//		])
//	}
//	//==========================================================================
//	required init?(coder: NSCoder) {
//		super.init(coder: coder)
//	}
//}
////==========================================================================
//
////
////  ServicePageVC.swift
////  Fawaz solo project
////
////  Created by Fawaz on 29/11/2021.
////
//
//import UIKit
//
//class ProductDiscrebtion : UIViewController{
//	var product1: PharmacyStruct?
//
//	var restFromVC2: DiscProduct?
//
//	let imageBlogPage = UIImageView()
//	let nameBlogPage = UILabel()
//	let staly = UILabel()
//	let textBlogPage = UILabel()
//	let button = UIButton()
//
//	//==========================================================================
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//		view.backgroundColor = UIColor (named: "myBackgroundColor2")
//
//		imageBlogPage.layer.masksToBounds = true
//		imageBlogPage.layer.cornerRadius = 10
//		imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
//		view.addSubview(imageBlogPage)
//		imageBlogPage.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//
//		NSLayoutConstraint.activate([
//			imageBlogPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//			imageBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//			imageBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6),
//			imageBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -6),
////			imageBlogPage.widthAnchor.constraint(equalToConstant: 400),
//			imageBlogPage.heightAnchor.constraint(equalToConstant: 300),
//		])
//		//========================================================================
//		nameBlogPage.textAlignment = .center
//		nameBlogPage.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//		nameBlogPage.textColor = .label
//		nameBlogPage.font = .systemFont(ofSize: 20)
//		nameBlogPage.layer.cornerRadius = 10
//		nameBlogPage.clipsToBounds = true
//		nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
//		view.addSubview(nameBlogPage)
//
//		NSLayoutConstraint.activate([
//			nameBlogPage.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 20),
//			nameBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////			nameBlogPage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
//			nameBlogPage.widthAnchor.constraint(equalToConstant: 350),
//			nameBlogPage.heightAnchor.constraint(equalToConstant: 50)
//		])
//		//========================================================================
//		staly.font = UIFont.systemFont(ofSize: 18)
//		staly.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//		staly.numberOfLines = 0
//		staly.textColor = .label
//		staly.translatesAutoresizingMaskIntoConstraints = false
//		//    staly.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//		staly.layer.cornerRadius = 10
//		staly.clipsToBounds = true
//		view.addSubview(staly)
//
//		NSLayoutConstraint.activate([
//			staly.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////			staly.widthAnchor.constraint(equalToConstant: 335),
//			staly.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
//			staly.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//			staly.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 20),
//			staly.heightAnchor.constraint(equalToConstant: 130),
//
//
////			staly.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////			staly.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 10),
////			staly.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
////			staly.widthAnchor.constraint(equalToConstant: 350),
////			staly.heightAnchor.constraint(equalToConstant: 70)
////
//		])
//		//========================================================================
//
//		textBlogPage.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//		textBlogPage.textColor = .label
//		textBlogPage.font = .systemFont(ofSize: 18)
//		textBlogPage.numberOfLines = 0
//		textBlogPage.textAlignment = .right
//		textBlogPage.translatesAutoresizingMaskIntoConstraints = false
//		view.addSubview(textBlogPage)
//
//		NSLayoutConstraint.activate([
//			textBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////			staly.widthAnchor.constraint(equalToConstant: 335),
//			textBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
//			textBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
//			textBlogPage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 20),
//			textBlogPage.heightAnchor.constraint(equalToConstant: 120),
//
////			textBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////			textBlogPage.widthAnchor.constraint(equalToConstant: 335),
////			textBlogPage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 20),
////			textBlogPage.heightAnchor.constraint(equalToConstant: 50)
////			textBlogPage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:30),
////			textBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
//		])
//		//========================================================================
//
//		button.setTitle(" أضف إلى السله", for: .normal)
//		button.setTitleColor(.label, for: .normal)
//		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
//		button.layer.cornerRadius = 20
//		button.clipsToBounds = true
//		button.translatesAutoresizingMaskIntoConstraints = false
//		view.addSubview(button)
//		button.backgroundColor = .systemGray4
//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
//
//		NSLayoutConstraint.activate([
//			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//			//      button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 330),
//
//			button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
//			button.widthAnchor.constraint(equalToConstant: 350),
//			button.heightAnchor.constraint(equalToConstant: 70)
//		])
//
//		//Add a Simple Alert with Buttons
//		button.addTarget(self, action: #selector(popupAlert), for: .touchUpInside)
//		self.view.addSubview(button)
//	}
//	@objc func popupAlert(sender: UIButton!){
//
//		let alert = UIAlertController(title: "هل تريد تقديم طلب على هذه الخدمه؟",
//									  message: "",
//									  preferredStyle: .alert)
//
//		alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { action in
//			cart.append(self.restFromVC2!)
//
//		}))
//		alert.addAction(UIAlertAction(title: "لا", style: .cancel, handler: { action in
//			print("Do not apply")}))
//
//		self.present(alert, animated: true)
////		navigationController?.pushViewController(CartViewController(), animated: true)
//
//	}
//
//}
////========================================================================
