//
//  MapVC.swift
//  Final Project
//
//  Created by Hassan Yahya on 01/05/1443 AH.
//

import UIKit
import MapKit

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
	var locationManager: CLLocationManager!
	var locationManger: CLLocationManager!
	lazy var mapView: MKMapView = {
		let mv = MKMapView()
		mv.translatesAutoresizingMaskIntoConstraints = false
		return mv
	}()
	override func viewDidLoad() {
		super.viewDidLoad()
		mapView.delegate = self
		if CLLocationManager.locationServicesEnabled() {
			locationManger = CLLocationManager()
			locationManger.delegate = self
			locationManger.desiredAccuracy = kCLLocationAccuracyBest
			locationManger.requestAlwaysAuthorization()
			locationManger.startUpdatingLocation()
		}
		view .addSubview(mapView)
		NSLayoutConstraint.activate([
			mapView.leftAnchor.constraint(equalTo: view.leftAnchor),
			mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
			mapView.topAnchor.constraint(equalTo: view.topAnchor),
			mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}








