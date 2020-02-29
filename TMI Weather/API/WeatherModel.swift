//
//  GetAPI.swift
//  TMI Weather
//
//  Created by Kyo Heo on 2/20/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import Foundation
//import Combine

class WeatherModel: ObservableObject {
    let myWeather: WeatherRequest?

    static var fiveDaysWeathers = [ListDetail5]()
    
    static var currentWeather: CurrentWeatherResponse?
    
    static var currentTemps = [Double]()
    
    init(zipCode: String, country: String, type: WeatherType) {
        myWeather = WeatherRequest(zipCode: zipCode, country: country, type: type)
        switch type {
            case .current:
                generateCurrentWeather()
            case .fiveDays:
                generateFiveDaysWeather()
        }
    }
    
    func generateFiveDaysWeather() {
        myWeather?.getFiveDaysWeather{ [weak self] result in
           switch result {
               case .failure(let error):
                    print(error)
               case .success(let weather):
                    WeatherModel.fiveDaysWeathers = weather.list
                    print("success loading 5days advenced weather")
           }
        }
    }
    
    func generateCurrentWeather() {
        myWeather?.getCurrentWeather{ [weak self] result in
           switch result {
               case .failure(let error):
                    print(error)
               case .success(let weather):
                    WeatherModel.currentWeather = weather
                    self?.generateCurrentTemp()
                    print("success loading current weather")
           }
        }
    }
     
    func generateCurrentTemp() {
        guard let myCurrentWeather = WeatherModel.currentWeather else { return }
        WeatherModel.currentTemps.append(myCurrentWeather.main.temp)
        WeatherModel.currentTemps.append(myCurrentWeather.main.temp_min)
        WeatherModel.currentTemps.append(myCurrentWeather.main.temp_max)
        WeatherModel.currentTemps.append(Double(myCurrentWeather.wind.deg))
        WeatherModel.currentTemps.append(myCurrentWeather.main.feels_like)

    }
}
