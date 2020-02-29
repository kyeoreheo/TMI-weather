//
//  CurrentTab.swift
//  TMI Weather
//
//  Created by Kyo Heo on 2/20/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

//should View gets data from Model
struct CurrentTabView: View {
    let city = WeatherModel.currentWeather?.name ?? "N/A"
    let tempCur = WeatherModel.currentWeather?.main.temp ?? 0
    let tempMin = WeatherModel.currentWeather?.main.temp_min ?? 0
    let tempMax = WeatherModel.currentWeather?.main.temp_max ?? 0
    let tempFel = WeatherModel.currentWeather?.main.feels_like ?? 0
    let windDeg = WeatherModel.currentWeather?.wind.deg ?? 0
    let windSpeed = WeatherModel.currentWeather?.wind.speed ?? 0
    let humidity = WeatherModel.currentWeather?.main.humidity ?? 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("City: \(city)")
            Spacer()
            HStack {
                ChartRec(txtDataName: "Max", data: tempMax)
                ChartRec(txtDataName: "Min", data: tempMin)
                ChartRec(txtDataName: "Cur", data: tempCur)
                ChartRec(txtDataName: "Win", data: Double(windDeg))
                Spacer()
                ChartCir(tempCur: tempCur, windSpeed: windSpeed, humidity: humidity)
            }//HStack for chart
        }
        .padding([.leading, .bottom, .trailing], 30.0)//VStack for main view.
    }//body
}

//MARK: - Preview
struct CurrentTab_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTabView()
    }
}

//MARK: - Extension
extension Double {
    var roundedString: String {
        return String(format: "%.1f", self)
    }
}

