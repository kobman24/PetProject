//
//  WeatherViewModel.swift
//  TheWeatherAppThree
//
//  Created by Сейран on 17.08.2023.
//

import Foundation
import CoreLocation
class WeatherViewModel: NSObject, ObservableObject {
    private var locationManager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var weatherData : WeatherData?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func fetchWeatherData() {
        guard let userLocation = userLocation else {return}
        WeatherAPI.fetchWeatherData(latitude: userLocation.latitude, longitude: userLocation.longitude) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.weatherData = data
                }
            case .failure(let error):
                print("Error fetching weather data: \(error)")
            }
            
        }
        
    }
}
    extension WeatherViewModel: CLLocationManagerDelegate {
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last?.coordinate {
                userLocation = location
                fetchWeatherData()
            }
        }
    }

