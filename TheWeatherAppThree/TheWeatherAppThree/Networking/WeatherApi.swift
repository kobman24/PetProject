//
//  WeatherApi.swift
//  TheWeatherAppThree
//
//  Created by Сейран on 17.08.2023.
//

import Foundation
import Foundation

struct WeatherAPI {
    static func fetchWeatherData(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let apiKey = "dd23837b53883a9269871d9ee875c906"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    do {
                        let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                        completion(.success(weatherData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    }
}
