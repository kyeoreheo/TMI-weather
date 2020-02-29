//
//  CirChart.swift
//  TMI Weather
//
//  Created by Kyo Heo on 2/29/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

struct ChartCir: View {
    @State var isViewOnScreen = false
    @State var circleSelected = ""
    let circleSize: CGFloat = 120
    let lightGray = MyColors.lightGray
    let darkGray = MyColors.darkGray
    
    let tempCur: Double
    let windSpeed: Double
    let humidity: Int
    
    var colors: [Color] = [.red, .orange, .yellow, .red]//, .green, .purple, .red]
    
    init(tempCur: Double, windSpeed: Double, humidity: Int){
        self.tempCur = tempCur
        self.windSpeed = windSpeed
        self.humidity = humidity
    }

    var body: some View {
        VStack {
            Spacer()
            Spacer()
            //circles
            ZStack {
                Circle () // difference of Max & Min temp - Big Circle
                    .fill(Color.white)
                    .frame(width: circleSize, height: circleSize)
                    .overlay( // backCircle - Big
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .fill(lightGray)
                            .opacity(0.4)
                    )
                    .overlay(
                        Circle()
                            .trim(from: 0, to : self.isViewOnScreen ? CGFloat(tempCur / 500) : 0)
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                    )
                    .animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
                    .onTapGesture {
                        withAnimation{
                            self.circleSelected = "big"
                        }
                    }
                Circle () // Humidity / Sauna - Middle Circle
                    .fill(Color.white)
                    .frame(width: circleSize * 0.6, height: circleSize * 0.6)
                    .overlay( // backCircle - middle
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .fill(lightGray)
                            .opacity(0.4)
                    )
                    .overlay(
                        Circle()
                            .trim(from: 0, to : self.isViewOnScreen ? CGFloat(Double(humidity) / 200) : 0)
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                    )
                    .animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
                    .onTapGesture {
                        withAnimation{
                            self.circleSelected = "middle"
                        }
                    }
                
                Circle () // Windspeed / MTAspeed - small Circle
                    .fill(Color.white)
                    .frame(width: circleSize * 0.2, height: circleSize * 0.2)
                    .overlay( // backCircle - small
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .fill(lightGray)
                            .opacity(0.4)
                    )
                    .overlay(
                        Circle()
                            .trim(from: 0, to : self.isViewOnScreen ? CGFloat(windSpeed / 30) : 0)
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                    )
                    .animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
                    .onTapGesture {
                        withAnimation{
                            self.circleSelected = "small"
                        }
                    }
                    
                    .onAppear(perform: {
                        self.isViewOnScreen.toggle()
                    })
                
                Text("\((tempCur / 500 * 100).roundedString )%")
                .offset(y:-65)
                .font(.system(size: 14))
                
                Text("\((Double(humidity) / 200 * 100).roundedString)%")
                .offset(y:-42)
                .font(.system(size: 14))
                
                Text("\((windSpeed / 30 * 100).roundedString)%")
                .offset(y:-20)
                .font(.system(size: 14))
            }//circles
            .padding(.bottom, 20.0)
            Spacer()
            //percentage detail
            ZStack {
                if circleSelected != "" {
                    Rectangle()
                    .fill(lightGray)
                    .frame(width: 120, height: 220)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .overlay(
                        Rectangle()
                        .fill(Color.white)
                        .frame(width: 110, height: 210)
                    )
                    .overlay(
                       Rectangle()
                       .fill(darkGray)
                       .frame(width: 15, height: 15)
                        .offset(x: 45, y: -95)
                        .onTapGesture {
                            withAnimation{
                                self.circleSelected = ""
                            }
                        }
                    )
                   
                    if circleSelected == "big" {
                        VStack{
                            Text("\((tempCur / 500 * 100).roundedString)%")
                            Text("")
                            Text("This is a percentage of current temperature over the years of Africa continent being exploited.")
                                .font(.system(size: 11))
                                .transition(.scale)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                            Text("")
                            Text("temp: \(tempCur.roundedString)")
                                .font(.system(size: 11))
                            Text("years: 500")
                                .font(.system(size: 11))
                        }
                        .frame(width: 110, height: 200)
                        Spacer()
                    } //if circleSelected = big
                    else if circleSelected == "middle" {
                        VStack{
                            Text("\((Double(humidity) / 200 * 100).roundedString)%")
                            Text("")
                            Text("This is a percentage of current humidity over the average humidity of sauna in NY.")
                                .font(.system(size: 11))
                                .transition(.scale)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                            Text("")
                            Text("humidity: \(humidity)")
                                .font(.system(size: 11))
                            Text("sauna: 200")
                                .font(.system(size: 11))
                        }
                        .frame(width: 110, height: 200)
                        Spacer()
                    } //if circleSelected = middle
                    else if circleSelected == "small" {
                        VStack{
                            Text("\((windSpeed / 30 * 100).roundedString)%")
                            Text("")
                            Text("This is a percentage of current wind speed over the MTA average speed in NY.")
                                .font(.system(size: 11))
                                .transition(.scale)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                            Text("")
                            Text("wind: \(windSpeed.roundedString) mph")
                                .font(.system(size: 11))
                            Text("MTA: 30 mph")
                                .font(.system(size: 11))
                        }
                        .frame(width: 110, height: 200)
                        Spacer()
                    } //if circleSelected = middle
                }//if circleSelected
            }//percentage detaie
        }
    }
    
}
