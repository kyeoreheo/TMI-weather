//
//  HistoryTab.swift
//  TMI Weather
//
//  Created by Kyo Heo on 2/20/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

struct ForecastTabView: View {
    var forecast: [[ListDetail5]] = []
    
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
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all) //set background

                VStack(spacing: 40) {
                    ForEach(0..<forecast.count) {
                        WeatherCell(weatherTimeLine: self.forecast[$0])
                    }
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
