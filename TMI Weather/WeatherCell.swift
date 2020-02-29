//
//  WeatherCell.swift
//  TMI Weather
//
//  Created by Kyo on 2/21/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

struct WeatherCell: View {
    let number: Int
    init(_ number: Int) {
        self.number = number
    }
    var body: some View {
        HStack {
            Text("\(number): WeatherCell --- ")
            Text("HI")
        } //HStack
    }
}

struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(3)
    }
}
