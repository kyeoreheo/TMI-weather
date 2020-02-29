//
//  ContentView.swift
//  TMI Weather
//
//  Created by Kyo Heo on 2/20/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//
import SwiftUI
import Combine

struct ContentView: View {
    let myAPI = WeatherModel(zipCode: "11221", country: "US", type: .current) // load data
    //@ObservedObject
    @State var scale: CGFloat = 1

    var body: some View{
        NavigationView {
            ZStack{
                MyColors.darkGray.edgesIgnoringSafeArea(.all) //set background
                
                VStack(alignment: .center){
                    
                    Spacer()
                    Text("- TMI Weather -")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Text("TMI Weather is an weather app that gives you too much imformations that you might not need. With these useless imformation, you can talk non-sense!")
                        .font(.system(size: 20))
                        .font(.system(.subheadline , design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20.0)
                    Text("Enjoy!")
                        .font(.system(size: 30))
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 15.0)
                    Spacer()
                    Spacer()
                    NavigationLink(destination: MainView()) {
                        Text("GetStarted")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                            .background(MyColors.lightGray)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                .stroke(MyColors.lightGray, lineWidth: 5)
                            )
                    }//NavLink
                    Spacer()
                }//Vstack
            }//ZStak
        }//Nav
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
