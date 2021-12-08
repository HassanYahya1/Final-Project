//
//  model.swift
//  Final Project
//
//  Created by Hassan Yahya on 01/05/1443 AH.
//



import Foundation

import UIKit
// add struct Location
struct Location {
	let id: String
	let userId: String
	let location: String
 
}


import UIKit

// add struct user
struct User {
  let id: String
  let name: String
  let status : String
  let image : String
  let location : String
}

import UIKit
import SwiftUI
//import Promises

struct PharmacyStruct {
	
	let image: UIImage?
	let name: String
	let discProduct: Array <DiscProduct>
}

struct DiscProduct{
	let imageA: UIImage?
	let nameA: String
	let staly: String
	let summaryA: String
	let price : Double
}

var pharmaciesData = [
	
	PharmacyStruct(
		image: UIImage(named: "النهدي"),
		name: "صيدلية النهدي",
		
		discProduct: [DiscProduct(
			imageA: UIImage(named: "shopping"),
			nameA:". شامبو دوكراى ١٠٠ مل",
			staly: "",
			summaryA: """
- وصف المنتج : وكراي شامبو كيلوال د س للحدّ من الإلتهاب الجلد الدهني 100 مل .

- السعر : 95 ر.س


""", price: 95
		),DiscProduct(
			imageA: UIImage(named: "images"),
			nameA:". شامبو كليفر ١٠٠مل",
			staly: "",
			summaryA: """
- وصف المنتج : كليفر شامبو يساعد للحدّ من الإلتهاب الجلد الدهني 100 مل .

- السعر : 31 ر.س


""", price: 31
		),DiscProduct(
			imageA: UIImage(named: "images-10"),
			nameA:"صبغة شعر لون بني",
			staly: "",
			summaryA: """
- وصف المنتج : صبغة شعر بني تساعد على لمعان الشعر.

- السعر : 43 ر.س


""", price: 43
		),DiscProduct(
			imageA: UIImage(named: "images-9"),
			nameA:"صبغة شعر لون اسود",
			staly: "",
			summaryA: """
- وصف المنتج : صبغة شعر اسود تساعد على لمعان الشعر.

- السعر : 46 ر.س


""", price: 46
		),DiscProduct(
			imageA: UIImage(named: "images-7"),
			nameA:"بروفين مقاس ٤٠٠",
			staly: "",
			summaryA: """
- وصف المنتج : حبوب بروفين مسكن للالام .

- السعر : 10.50 ر.س


""", price: 10
		),
			
			DiscProduct(
				imageA: UIImage(named: "shopping-2"),
				nameA: " صبغة ريفوليوشن",
				staly: "",
				summaryA: """
وصف المنتج : ريفوليوشن صبغة الشعر المؤقته اللون اللون الارجوانى 90 مل .

السعر : 41 ر.س

""", price: 41
			)]
	),
	//==========================================================================
	
	PharmacyStruct(
		image: UIImage(named: "الدوا"),
		name: "صيدلية الدواء",
		
		discProduct: [DiscProduct(
			imageA: UIImage(named: "بندول١"),
			nameA: "بندول الازرق ٥٠٠ مل .",
			staly: "",
			summaryA: """
وصف المنتج : علاج الالم و تسكينه اعتمادا على الباراسيتامول .

السعر : 7 ر.س
""", price: 7
		),DiscProduct(
			imageA: UIImage(named: "images-8"),
			nameA: "صبغة ويلموكسون",
			staly: "",
			summaryA: """
وصف المنتج : صبغة سوداء تساعد على لمعان الشعر .

السعر :21 ر.س
""", price: 21
		),DiscProduct(
			imageA: UIImage(named: "images-6"),
			nameA: "استشوار شعر",
			staly: "",
			summaryA: """
وصف المنتج : استشوار شعر يساعد علئ تصفيف و ترتيب الشعر .

السعر : 65 ر.س
""", price: 65
		),DiscProduct(
			imageA: UIImage(named: "images-2"),
			nameA: "مرطب ايدي كاتفيل",
			staly: "",
			summaryA: """
وصف المنتج : مرهم يعمل على ترطيب اليدين ويجعلها اكثر نعومه .

السعر : 19 ر.س
""", price: 19
		),
			DiscProduct(
				imageA: UIImage(named: "shopping-2"),
				nameA: " صبغة ريفوليوشن",
				staly: "",
				summaryA: """
وصف المنتج : ريفوليوشن صبغة الشعر المؤقته اللون اللون الارجوانى 90 مل .

السعر : 41 ر.س

""", price: 41
			),DiscProduct(
				imageA: UIImage(named: "images"),
				nameA:". شامبو كليفر ١٠٠مل",
				staly: "",
				summaryA: """
 - وصف المنتج : كليفر شامبو يساعد للحدّ من الإلتهاب الجلد الدهني 100 مل .
 
 - السعر : 30.99 ر.س
 
 
 """, price: 30.99
			),DiscProduct(
				imageA: UIImage(named: "images-4"),
				nameA: "مرهم نيفيا",
				staly: "",
				summaryA: """
وصف المنتج : يعالج تشققات اليدين و يساعد على ترطيبها .

السعر : 14 ر.س
""", price: 14
			),DiscProduct(
				imageA: UIImage(named: "images-5"),
				nameA: "استشوار ذكي لاسلكي",
				staly: "",
				summaryA: """
وصف المنتج : استشوار الماني ذو الثلاث رؤوس متغيره يساعد الشعر المتجعد .

السعر : 81 ر.س
""", price: 81
			)
		   ]
	),
	
	//==========================================================================
	
	PharmacyStruct(
		image: UIImage(named: "وايتس"),
		name: "صيدلية وايتس",
		
		discProduct: [DiscProduct(
			imageA: UIImage(named: "images-5"),
			nameA: "استشوار ذكي لاسلكي",
			staly: "",
			summaryA: """
 وصف المنتج : استشوار الماني ذو الثلاث رؤوس متغيره يساعد الشعر المتجعد .
 
 السعر : 81 ر.س
 """, price: 81
		),DiscProduct(
			imageA: UIImage(named: "بندول١"),
			nameA: "بندول الازرق ٥٠٠ مل .",
			staly: "",
			summaryA: """
وصف المنتج : علاج الالم و تسكينه اعتمادا على الباراسيتامول .

السعر : 8 ر.س
""", price: 8
		),
			DiscProduct(
				imageA: UIImage(named: "shopping"),
				nameA:". شامبو دوكراى ١٠٠ مل",
				staly: "",
				summaryA: """
 - وصف المنتج : وكراي شامبو كيلوال د س للحدّ من الإلتهاب الجلد الدهني 100 مل .
 
 - السعر : 87 ر.س
 
 
 """, price: 87
			),
			DiscProduct(
				imageA: UIImage(named: "images-10"),
				nameA:"صبغة شعر لون بني",
				staly: "",
				summaryA: """
  - وصف المنتج : صبغة شعر بني تساعد على لمعان الشعر.
  
  - السعر : 33.90 ر.س
  
  
  """, price: 33.90
			),
			DiscProduct(
				imageA: UIImage(named: "images-7"),
				nameA:"بروفين مقاس ٤٠٠",
				staly: "",
				summaryA: """
   - وصف المنتج : حبوب بروفين مسكن للالام .
   
   - السعر : 10.90 ر.س
   
   
   """, price: 10.90
			),
			DiscProduct(
				imageA: UIImage(named: "images-8"),
				nameA: "صبغة ويلموكسون",
				staly: "",
				summaryA: """
 وصف المنتج : صبغة سوداء تساعد على لمعان الشعر .
 
 السعر : 21 ر.س
 """, price: 21
			)
		   ]
	),
	
	//==========================================================================
	PharmacyStruct(
		image: UIImage(named: "بوت"),
		name: "صيدلية بوتز",
		
		discProduct: [DiscProduct(
			imageA: UIImage(named: "كحه"),
			nameA: "علاج الكحه نوتوسيل",
			staly: "",
			summaryA: """
 وصف المنتج : علاج الكحه للبالغين و مهدىء فعال للالام الصدرية.
 
 السعر : 8 ر.س
 """, price: 8
		),DiscProduct(
			imageA: UIImage(named: "images-11"),
			nameA: "امواس حلاقه نسائيه ",
			staly: "",
			summaryA: """
 وصف المنتج : امواس حلاقه للنساء ذات شفرات حاده .
 
 السعر: 17 ر.س
 """, price: 17
		),DiscProduct(
			imageA: UIImage(named: "images-13"),
			nameA: "علاج الكحه بروسبين ",
			staly: "",
			summaryA: """
 وصف المنتج : علاج لالم الكحه و البلغم والجفاف الصدري .
 
 السعر : 28 ر.س
 """, price: 28
		),DiscProduct(
			imageA: UIImage(named: "images-10"),
			nameA:"صبغة شعر لون بني",
			staly: "",
			summaryA: """
 - وصف المنتج : صبغة شعر بني تساعد على لمعان الشعر.
 
 - السعر : 33 ر.س
 
 
 """, price: 33
		),DiscProduct(
			imageA: UIImage(named: "images-4"),
			nameA: "مرهم نيفيا",
			staly: "",
			summaryA: """
وصف المنتج : يعالج تشققات اليدين و يساعد على ترطيبها .

السعر : 14 ر.س
""", price: 14
		),DiscProduct(
			imageA: UIImage(named: "بندول١"),
			nameA: "بندول الازرق ٥٠٠ مل .",
			staly: "",
			summaryA: """
 وصف المنتج : علاج الالم و تسكينه اعتمادا على الباراسيتامول .
 
 السعر : 8 ر.س
 """, price: 8
		),DiscProduct(
			imageA: UIImage(named: "images-5"),
			nameA: "استشوار ذكي لاسلكي",
			staly: "",
			summaryA: """
 وصف المنتج : استشوار الماني ذو الثلاث رؤوس متغيره يساعد الشعر المتجعد .
 
 السعر : 71 ر.س
 """, price: 71
		),
			DiscProduct(
				imageA: UIImage(named: "images"),
				nameA:". شامبو كليفر ١٠٠مل",
				staly: "",
				summaryA: """
   -وصف المنتج : كليفر شامبو يساعد للحدّ من الإلتهاب الجلد الدهني 100 مل .
 
 - السعر : 32 ر.س


 """, price: 32
			)
		   ]
	),
	
	]
