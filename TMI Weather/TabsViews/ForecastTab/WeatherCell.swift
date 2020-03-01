//
//  WeatherCell.swift
//  TMI Weather
//
//  Created by Kyo on 2/21/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

struct WeatherCell: View {
    @State var isDetailOnScreen = false
    let weatherTimeLine: [ListDetail5]
    let mainTemps : [Main5]
//I need array of only main.
    
    init(weatherTimeLine: [ListDetail5]) {
        self.weatherTimeLine = weatherTimeLine
        self.mainTemps = weatherTimeLine.map { $0.main }
    }

    
    var body: some View {
        VStack{
            HStack {//whole frame
                HStack{//weather preview
                    Text("\((weatherTimeLine[0].dt_txt)[5..<10])")//list.dt_txt: "2020-03-01
                    Text("\(weatherTimeLine[0].main.temp.roundedString)")//list.main.temp
                    Text("\(weatherTimeLine[0].weather[0].description)")//list.weather.description
                }//weather preview
                
                Spacer()
                
                //Detail button
                Text("Detail")
                    .fontWeight(.bold)
                    .padding(.horizontal, 5.0)
                    .background(MyColors.lightGray)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                        .stroke(MyColors.lightGray, lineWidth: 5)
                    )
                .onTapGesture(perform: {
                    withAnimation{
                        self.isDetailOnScreen.toggle()
                    }
                })
                
                
                
            }//whole frame
            .padding(.horizontal) //HStack
            HStack{
                if isDetailOnScreen {
                    // a day's temps
                    LineChart(mainTemps: mainTemps)
                }
            }
        }
    }
}

