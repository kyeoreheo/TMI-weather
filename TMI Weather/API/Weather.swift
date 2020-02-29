//
//  Weather.swift
//  Holidays
//
//  Created by Kyo on 2/18/20.
//  Copyright © 2020 Kyo. All rights reserved.
//

import Foundation

struct CurrentWeatherResponse: Decodable {
    var coord: Coord
    var weather: [WeatherDetail]
    var base: String
    var main: Main
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct Coord: Decodable {
    var lon: Double
    var lat: Double
}

struct WeatherDetail: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Decodable {
    var temp: Double // 278.98
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int

}

struct Wind: Decodable {
    var speed: Double //2.6
    var deg: Int //280
}

struct Clouds: Decodable {
    var all: Int
}

struct Sys: Decodable {
    var type: Int //1
    var id: Int //5141
    var country: String //"US"
    var sunrise: Int // 1582026390
    var sunset: Int // 1582065190
}

/// MARK - 5days advence

struct FiveDaysResponse: Decodable {
    var cod: String
    var message: Int
    var cnt: Int
    var list: [ListDetail5]
    var city: City5
}

struct City5: Decodable {
    var name: String
    var coord: Coord5
    var country: String
    var timezone: Int
    var sunrise: Int
    var sunset: Int
}

struct ListDetail5: Decodable { //weathers by time 3hours
    var dt: Int
    var main: Main5
    var weather: [WeatherDetail5]
    var clouds: Clouds5
    var wind: Wind5
    var sys: Sys5
    var dt_txt: String
}

struct Main5: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var sea_level: Int
    var grnd_level: Int
    var humidity: Int
    var temp_kf: Double
}

struct WeatherDetail5: Decodable {
    var id : Int
    var main: String
    var description: String
    var icon: String
}

struct Clouds5: Decodable {
    var all: Int
}

struct Wind5: Decodable {
    var speed: Double
    var deg: Int
}

struct Sys5: Decodable {
    var pod: String
}

struct Coord5: Decodable {
    var lat: Double
    var lon: Double
}
