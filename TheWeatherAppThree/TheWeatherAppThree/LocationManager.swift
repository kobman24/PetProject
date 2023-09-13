
//
//  LocationManagerTrue.swift
//  WeatherAppFinal
//
//  Created by Сейран on 18.08.2023.
//

import Foundation
import CoreLocation


class LocationManagerTrue: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()

    @Published var userLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did update locations")
        guard let location = locations.last?.coordinate else { return }
        userLocation = location
    }
}


//class LocaltionManagerTrue: NSObject, CLLocationManagerDelegate {
//    let locationManager = CLLocationManager()
//
//
//    func startLocationManager() {
//        locationManager.requestWhenInUseAuthorization()
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
//            locationManager.pausesLocationUpdatesAutomatically = false
//            locationManager.startUpdatingLocation()
//        }
//    }
//
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
//        if let lastLocation = locations.last {
//            print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
//        }
//    }
//
//}


