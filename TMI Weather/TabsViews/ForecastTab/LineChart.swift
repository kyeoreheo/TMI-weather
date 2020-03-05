//
//  LineChart.swift
//  TMI Weather
//
//  Created by Kyo Heo on 3/1/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI
import Combine

class LineGenerator: ObservableObject {
    @Published var currentTempLine: [CGPoint] = []
    @Published var feelsTempLine: [CGPoint] = []
    @Published var randomTempLine: [CGPoint] = []
    @Published var title = "HI"
    
    init(inputArray: [Main5] ) {
        var currentTemps: [Double] = []
        var feelsTemp: [Double] = []
        
        inputArray.forEach {
            currentTemps.append($0.temp)
            feelsTemp.append($0.feels_like)
        }
        
        for i in 0..<inputArray.count {
            let myX = (330.0 / Double(inputArray.count) * Double(i)) + (330.0 / Double(inputArray.count*2) + Double(inputArray.count) / 2.66 * Double(i))
            let diff = currentTemps.max()! - currentTemps.min()!
            let currentTempY = -(( currentTemps[i] - currentTemps.min()! ) * 110.0 / diff ) + 150.0
            let feelsTempY = -(( feelsTemp[i] - feelsTemp.min()! ) * 110.0 / (feelsTemp.max()! - feelsTemp.min()!) ) + 150.0
            currentTempLine.append(.init(x: myX , y: currentTempY ))
            feelsTempLine.append(.init(x: myX, y: feelsTempY))
            randomTempLine.append(.init(x: myX, y: Double.random(in: 40...150)))
        }
    }

}

struct LineChart: View {
    @State var isViewOnScreen = false
    @State var isCheckMarkOn = false
    let lightGray = MyColors.lightGray
    let darkGray = MyColors.darkGray
    let mainTemps: [Main5]
    
    @ObservedObject var lineGenerator: LineGenerator

    //let gap: Double
    
    init (mainTemps: [Main5]) {
        self.mainTemps = mainTemps
        lineGenerator = LineGenerator(inputArray: mainTemps)
       
    }
    //input data, color
    let betweenGap = 0
    var body: some View {
        HStack{
            if isViewOnScreen {
                ZStack {
                    Rectangle()
                        .fill(lightGray)
                        .frame(width: 350, height: 220)
                        .transition(.asymmetric(insertion: .opacity, removal: .opacity))
                        .overlay(
                            Rectangle()
                            .fill(Color.white)
                            .frame(width: 340, height: 210)
                        )
                    HStack {
                        Spacer()
                        ForEach (0..<mainTemps.count) { num in
                            VStack { //each colums --space, text
                                Spacer()
//                                Text("\(self.mainTemps[num].temp.roundedString)")
//                                    .font(.system(size: 12))
//                                    .frame(width: 35, height: 20)
                                    
                                    if num * 3 < 10 {
                                        Text("0\(num * 3):00")
                                            .frame(width: 35, height: 20)
                                            .font(.system(size: 10))

                                    } else {
                                        Text("\(num * 3):00")
                                            .frame(width: 35, height: 20)
                                            .font(.system(size: 10))
                                    }
                            } //Vstack
                            Spacer()
                        } // ForEach
                    } //HStack
                    .frame(width: 330, height: 220)
                    .padding(.bottom)
                    Path { $0.addLines(lineGenerator.currentTempLine) }
                        .trim(from: 0, to: isCheckMarkOn ? 1 : 0)
                        .scale(1, anchor: .topLeading)
                        .stroke(Color.yellow, lineWidth: 5)
                        .animation(Animation.easeOut(duration: 2.0).delay(0.5))
                         // current Temp
                    Path { $0.addLines(lineGenerator.feelsTempLine) }
                       .trim(from: 0, to: isCheckMarkOn ? 1 : 0)
                       .scale(1, anchor: .topLeading)
                       .stroke(Color.green, lineWidth: 5)
                       .animation(Animation.easeOut(duration: 2.0).delay(0.5))
                    Path { $0.addLines(lineGenerator.randomTempLine) }
                        .trim(from: 0, to: isCheckMarkOn ? 1 : 0)
                        .scale(1, anchor: .topLeading)
                        .stroke(Color.orange, lineWidth: 5)
                        .animation(Animation.easeOut(duration: 2.0).delay(0.5))
                    .onAppear() {
                        self.isCheckMarkOn.toggle()
                    }
                       
                } //ZStack
                .frame(width: 330, height: 220)
                .scaleEffect(0.9)
                
                VStack {
                    Text(" ")
                    Text(" ")

                    ForEach (0..<mainTemps.count) {
                        Text("\(self.mainTemps[$0].temp.roundedString)")
                            .font(.system(size: 10))
                    }
                    Spacer()
                }
                .frame(width:30, height: 220)
                Spacer()
            }
            
            
        }
        .onAppear() {
            withAnimation{
                self.isViewOnScreen.toggle()
            }
        }
    }
}
