//
//  PharmacyCell.swift
//  Final Project
//
//  Created by Hassan Yahya on 03/05/1443 AH.
//


import UIKit

class PharmacyCell: UICollectionViewCell {
	
	static let identifier = "CourtVC_Cell_key"
	
	//==========================================================================
	//	let staly: UILabel = {
	//		let staly = UILabel()
	//		staly.textColor = .label
	////		staly.layer.cornerRadius = 40
	//		staly.clipsToBounds = true
	//		staly.backgroundColor = .systemGray4
	//		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
	//
	//		return staly
	//	}()
	//==========================================================================
	let myImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		//		imageView.tintColor = .label
		imageView.layer.cornerRadius = 60
		imageView.clipsToBounds = true
		//		imageView.backgroundColor = .systemGray4
		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
		
		return imageView
	}()
	//==========================================================================
	let name: UILabel = {
		let label = UILabel()
		label.textColor = .label
		label.numberOfLines = 0
		label.textAlignment = .center
		//		label.backgroundColor = .systemGray4
		//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
		
		return label
	}()
	//==========================================================================
	override init (frame: CGRect) {
		super.init(frame: frame)
		
		contentView.addSubview(myImageView)
		contentView.addSubview(name)
		contentView.clipsToBounds = true
		
		contentView.layer.cornerRadius = 20
		contentView.backgroundColor = UIColor(named: "Cell")
		
		contentView.addSubview(myImageView)
		myImageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			myImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
			myImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12),
			myImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
			myImageView.heightAnchor.constraint(equalToConstant: 120)
		])
		
		contentView.addSubview(name)
		name.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			name.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 24),
			//			name.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
			//			name.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
			name.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
			
		])
	}
	//==========================================================================
	required init?(coder: NSCoder) {
		fatalError( "init(coder:) has not been implemented")
	}
	
	//==========================================================================
	public func configure(label: String) {
		name.text = label
	}
	//==========================================================================
	override func prepareForReuse() {
		super.prepareForReuse()
		name.text = nil
	}
	
}
