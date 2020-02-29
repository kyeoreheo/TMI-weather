//
//  RecChart.swift
//  TMI Weather
//
//  Created by Kyo Heo on 2/29/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

struct ChartRec: View {
    var data: Double
    let txtDataName: String
    @State var selected = false

    init(txtDataName: String, data: Double) {
        self.txtDataName = txtDataName
        self.data = data
    }

    var body: some View {
        VStack{
            Spacer()
            Text("\(data.roundedString)")
                .font(.footnote)
                .rotationEffect(.degrees(-90))
                .zIndex(1)
                .offset(y: self.data <= 50 ? 0 : 40)
                
            Rectangle()
                .fill(MyColors.honey)
                .frame(width: CGFloat(40), height: self.selected ? CGFloat(data) : 0)
                .animation(Animation.easeOut(duration: 1))
                .onTapGesture {
                }.onAppear(perform: {
                    self.selected.toggle()
                })
            Text("\(txtDataName)")
        }//VStack for rect
    }//body
}
