//
//  HistoryTab.swift
//  TMI Weather
//
//  Created by Kyo Heo on 2/20/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

struct HistoryTabView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                
                ForEach(0..<10) {
                    WeatherCell($0)
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

struct HistoryTabView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTabView()
    }
}
