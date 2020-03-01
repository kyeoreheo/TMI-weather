//
//  HistoryTab.swift
//  TMI Weather
//
//  Created by Kyo Heo on 2/20/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

struct ForecastTabView: View {
    //    let city = WeatherModel.currentWeather?.name ?? "N/A"
    let days: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday","Saturday", "Sunday"]
    var forecast: [[ListDetail5]] = []
    //each day 8 time zone.
    
    init() {
        self.generateForcaseData()
    }
    
    mutating func generateForcaseData() {
        guard let myForecast = WeatherModel.fiveDaysWeathers
        else { return }
        
        var tempDate = myForecast[0].dt_txt.prefix(10)
        var tempListDetail: [ListDetail5] = []
        myForecast.forEach { timeLine in
            if timeLine.dt_txt.prefix(10) != tempDate {
                forecast.append(tempListDetail)
                tempListDetail = []
                tempDate = timeLine.dt_txt.prefix(10)
            }
            tempListDetail.append(timeLine)
         }
        forecast.append(tempListDetail)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<5) {
                    //Text("\(self.forecast.count)")
                    WeatherCell(weatherTimeLine: self.forecast[$0])
                        .padding(.all, 40.0)
                    //Text("Item \($0)")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .background(Color.red)
//                    Text("HI")
                    
                    
                }
            }
        }
    }
}

struct ForecastTabView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastTabView()
    }
}
