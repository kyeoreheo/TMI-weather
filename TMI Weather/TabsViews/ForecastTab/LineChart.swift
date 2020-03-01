//
//  LineChart.swift
//  TMI Weather
//
//  Created by Kyo Heo on 3/1/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

struct LineChart: View {
    @State var isViewOnScreen = false
    @State var isCheckMarkOn = false
    let lightGray = MyColors.lightGray
    let darkGray = MyColors.darkGray
    let mainTemps: [Main5]
    
    init (mainTemps: [Main5]) {
        self.mainTemps = mainTemps
    }
    //input data, color
    var body: some View {
        HStack{
            if isViewOnScreen {
                ZStack {
                    Rectangle()
                        .fill(lightGray)
                        .frame(width: 300, height: 220)
                        .transition(.asymmetric(insertion: .opacity, removal: .opacity))
                        .overlay(
                            Rectangle()
                            .fill(Color.white)
                            .frame(width: 290, height: 210)
                        )
                    HStack {
                        ForEach (0..<mainTemps.count) {num in
                            Text("\(self.mainTemps[num].temp)")
                        }
                    
                        
                    
                        
                        
                    }
                    .padding(.bottom)
                    Path { path in
                        path.addLines([
                            .init(x: 0, y: 0),
                            .init(x: 100, y: 110),
                            .init(x: 150, y: 90)
                        ])
                    }
                    .trim(from: 0, to: isCheckMarkOn ? 1 : 0)
                    .scale(2, anchor: .topLeading)
                    .stroke(Color.black, lineWidth: 10)
                    .animation(Animation.easeOut(duration: 1.0).delay(0.5))
                    .onAppear() {
                        self.isCheckMarkOn.toggle()
                    }


                }
                .frame(width: 300, height: 220)
            }
            
            
        }
        .onAppear() {
            withAnimation{
                self.isViewOnScreen.toggle()
            }
        }
    }
}
