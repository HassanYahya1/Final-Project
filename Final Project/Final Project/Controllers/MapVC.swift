//
//  MapVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 01/05/1443 AH.
//
//
import UIKit
import MapKit

class MapVC: UIViewController {
	let mapView : MKMapView = {
		let map = MKMapView()
		map.overrideUserInterfaceStyle = .light
		return map
	}()
	override func viewDidLoad() {
		super.viewDidLoad()
		setMapConstraints()
	}
	func setMapConstraints() {
		view.addSubview(mapView)
		mapView.translatesAutoresizingMaskIntoConstraints = false
		mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
		mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
		mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
		mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
		
		let A = MKPointAnnotation()
		A.title = NSLocalizedString("Al-dawaa Pharmacy", comment: "")
		A.coordinate = CLLocationCoordinate2D(latitude: 28.391610, longitude: 36.531760)
		mapView.addAnnotation(A)
		let S = MKPointAnnotation()
		S.title = NSLocalizedString("Al-nahdi Pharmacy", comment: "")
		S.coordinate = CLLocationCoordinate2D(latitude: 24.831233, longitude: 46.745805)
		mapView.addAnnotation(S)
		let F = MKPointAnnotation()
		F.title = NSLocalizedString("Boots Pharmacy", comment: "")
		F.coordinate = CLLocationCoordinate2D(latitude: 21.549296, longitude: 39.147684)
		mapView.addAnnotation(F)
		let C = MKPointAnnotation()
		C.title = NSLocalizedString("Whites Pharmacy", comment: "")
		C.coordinate = CLLocationCoordinate2D(latitude: 18.228567, longitude: 42.543820)
		mapView.addAnnotation(C)
		let D = MKPointAnnotation()
		D.title = NSLocalizedString("Al-nahdi Pharmacy", comment: "")
		D.coordinate = CLLocationCoordinate2D(latitude: 17.494942, longitude: 47.101904)
		mapView.addAnnotation(D)
		let W = MKPointAnnotation()
		W.title = NSLocalizedString("Al-dawaa Pharmacy", comment: "")
		W.coordinate = CLLocationCoordinate2D(latitude: 26.428751, longitude: 50.107640)
		mapView.addAnnotation(W)
	}
}








