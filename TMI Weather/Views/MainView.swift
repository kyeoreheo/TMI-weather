//
//  Main.swift
//  TMI Weather
//
//  Created by Kyo Heo on 2/20/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI



struct MainView: View {
    @State private var selection = "HistoryTab"
//    @ObservedObject var weatherModel = WeatherModel(zipCode: "11221", country: "US", type: .current)

    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ZStack{
                    MyColors.darkGray.edgesIgnoringSafeArea(.all) //set background
                    
                    VStack{
                        VStack{ //-MainView (Top side)
                            //Text("\(self.weatherModel.currentWeather?.name ?? "NA")")
                            
                            if self.selection == "CurrentTab" {
                                //Text("\(geometry.size.height)")
                                Text("I Know nobody uses Kelvin for temperature,")
                                    .font(.system(size: 15))
                                    .font(.system(.subheadline , design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("so this is a chance to use it!")
                                    .font(.system(size: 15))
                                    .font(.system(.subheadline , design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20.0)

                            } else if self.selection == "HistoryTab" {
                                Text("Most of weather apps are not accurate,")
                                    .font(.system(size: 15))
                                    .font(.system(.subheadline , design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("but I will guarantee that this will be 99% sure!")
                                    .font(.system(size: 15))
                                    .font(.system(.subheadline , design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Because this is random past weather.")
                                    .font(.system(size: 15))
                                    .font(.system(.subheadline , design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20.0)
                            } else if self.selection == "ArbitraryTab" {
                                Text("C")
                            }
                            Spacer()
                            Spacer()
                            

                            //UselessInformationView()
                            
                        }
                        .padding(.bottom, 200.0)
                        //.fixedSize()

                        .frame(width: geometry.size.width, height: -50)
                        
                        TabView(selection: self.$selection) {
                            
                            //CurrentTabView(currentWeather: self.$weatherModel.currentWeather)
                            CurrentTabView()
                            .tabItem({
                                Text("CurrentTab")
                            }).tag("CurrentTab")
                        
////
                            HistoryTabView()
                            .tabItem({
                                Text("HistoryTab")
                            }).tag("HistoryTab")

                            ArbitraryTab()
                            .tabItem({
                                Text("ArbitraryTab")
                            }).tag("ArbitraryTab")
                        }//TabView - switchign views
                    }//VStack - MainView + TabView
                }//ZStack - for background
            }// Geomtry - To get superView size
        }//Nav
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
