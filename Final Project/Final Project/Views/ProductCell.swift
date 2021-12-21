//
//  ProductCell.swift
//  Final Project
//
//  Created by Hassan Yahya on 03/05/1443 AH.
//

import UIKit

class ProductCell: UITableViewCell {
	
	static let identifier = "Service_Cell_key"
	var book: DiscProduct?
	var isActive: Bool = false
	let imageCell = UIImageView()
	let nameCell = UILabel()
	let stalyCell = UILabel()
	let priceLbl = UILabel()
	//	let likeLbl = UILabel()
	
	
	//==========================================================================
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
		
		super.init(style: style , reuseIdentifier: reuseIdentifier)
		contentView.addSubview(favButton)
		
		//========================================================================
		imageCell.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(imageCell)
		imageCell.contentMode = .scaleAspectFit
		imageCell.tintColor = .label
		imageCell.layer.masksToBounds = true
		imageCell.layer.cornerRadius = 15
		imageCell.backgroundColor = UIColor(named: "Cell")
		imageCell.tintColor = UIColor(named: "Tint")
		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
		
		NSLayoutConstraint.activate([
			imageCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
			imageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
			imageCell.heightAnchor.constraint(equalToConstant: 50),
			imageCell.widthAnchor.constraint(equalToConstant: 50)
		])
		//========================================================================
		stalyCell.font = UIFont.systemFont(ofSize: 20)
		stalyCell.numberOfLines = 0
		stalyCell.textColor = .label
		stalyCell.translatesAutoresizingMaskIntoConstraints = false
		stalyCell.backgroundColor = UIColor(named: "Cell")
		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
		stalyCell.layer.cornerRadius = 10
		stalyCell.clipsToBounds = true
		
		self.addSubview(stalyCell)
		
		NSLayoutConstraint.activate([
			stalyCell.centerYAnchor.constraint(equalTo: centerYAnchor),
			stalyCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
			stalyCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -5),
			stalyCell.heightAnchor.constraint(equalToConstant: 50)
			
		])
		//========================================================================
		nameCell.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(nameCell)
		
		nameCell.textColor = .label
		nameCell.textAlignment = .right
		nameCell.backgroundColor = UIColor(named: "Cell")
		nameCell.textColor = UIColor(named: "Tint")
		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
		nameCell.font = UIFont.systemFont(ofSize: 20)
		
		NSLayoutConstraint.activate([
			nameCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -15),
			nameCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
			//      nameCell.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			nameCell.centerYAnchor.constraint(equalTo: centerYAnchor),
			nameCell.heightAnchor.constraint(equalToConstant: 45)
		])
		
		
		self.addSubview(priceLbl)
		priceLbl.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			priceLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
			priceLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
			priceLbl.topAnchor.constraint(equalTo: topAnchor, constant: 25)
			
		])
		//		favButton.frame = CGRect(x: 140, y: contentView.frame.size.height - 55, width: 40, height: 40)
		self.addSubview(favButton)
		NSLayoutConstraint.activate([
			favButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 90),
			favButton.topAnchor.constraint(equalTo: topAnchor, constant: 24),
			favButton.heightAnchor.constraint(equalToConstant: 30),
			favButton.widthAnchor.constraint(equalToConstant: 30)
			
		])
	}
	var favButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.cornerRadius = 20
		button.layer.masksToBounds = true
		button.setImage(UIImage(named: "like"), for: .normal)
		button.addTarget(self, action: #selector(addfavoritePlace), for: .touchUpInside)
		return button
	}()
	
	@objc func addfavoritePlace() {
		
		if isActive {
			isActive = false
			favButton.setImage(UIImage(named: "like2"), for: .normal)
		} else {
			
			isActive = true
			favButton.setImage(UIImage(named: "like"), for: .normal)
			
		}
		
		let bookname = nameCell.text ?? ""
		_ = imageCell.image ?? UIImage(systemName: "house")
		FavoriteServiceVisitor.shared.addToFavorite(
			favPlace:
				FavArabic(
					image: book?.imageA ?? "",
					name: bookname,
					id: book?.id ?? ""
				)
		)
	}
	func setCell(book: DiscProduct) {
		imageCell.image = UIImage(named: book.imageA!)
		nameCell.text = book.nameA
		self.book = book
	}
	//==========================================================================
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
}
