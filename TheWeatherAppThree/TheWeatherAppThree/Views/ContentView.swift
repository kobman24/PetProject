//
//  ContentView.swift
//  TheWeatherAppThree
//
//  Created by Сейран on 17.08.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    var body: some View {
        if let weatherData = viewModel.weatherData {
            WeatherView(cityName: weatherData.name, temp: weatherData.main.temp, pressure: weatherData.main.pressure, humidity: weatherData.main.humidity)
        } else {
            VStack{
                Text("Данные о погоде загружаются")
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .red))
                    
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
