//
//  CartService.swift
//  Final Project
//
//  Created by Hassan Yahya on 05/05/1443 AH.
//


import UIKit
import FirebaseFirestore


class CartService {
	static let shared = CartService()
	
	let studentsCollection = Firestore.firestore().collection("products")
	// Add Student
	func addStudent(student: DiscProduct) {
		studentsCollection.document(student.id).setData([
			"name": student.nameA,
			"id": student.id,
			"price": student.price,
			"imageA": student.imageA
			
		])
	}
	
	// Delete Student
	func deleteStudent(studentId: String) {
		studentsCollection.document(studentId).delete()
	}
	
	// Listen to Students
	func listenToStudents(completion: @escaping (([DiscProduct]) -> Void)) {
		
		studentsCollection.addSnapshotListener { snapshot, error in
			if error != nil {
				return
			}
			
			guard let documents = snapshot?.documents else { return }
			
			var students: Array<DiscProduct> = []
			for document in documents {
				let data = document.data()
				let student = DiscProduct(
					
					id: (data["id"] as? String) ?? "No id",
					imageA: (data["imageA"] as? String),
					nameA:(data["name"] as? String) ?? "No name",
					staly: "",
					summaryA: "",
					price: (data["price"] as? Double) ?? 0
				)
				students.append(student)
			}
			
			completion(students)
		}
	}
	
	// Get Student Count
	func listenToStudentCount(completion: @escaping ((Int) -> Void)) {
		listenToStudents { students in
			completion(students.count)
		}
	}
}
