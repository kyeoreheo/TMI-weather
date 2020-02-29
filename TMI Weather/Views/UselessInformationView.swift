//
//  UselessInformation.swift
//  TMI Weather
//
//  Created by Kyo on 2/21/20.
//  Copyright © 2020 Kyo Heo. All rights reserved.
//

import SwiftUI

struct UselessInformationView: View {
    @State private var cardOn = false
    let dummyTitles: [String] = ["A", "B", "C"]
    let dum: String
    
    init(){
        dum = dummyTitles.randomElement()!
    }

    var body: some View {
        ZStack{
            HStack{
                Button("Tap Me") {
                    self.cardOn.toggle()
                }
                
                if cardOn {
                Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 50.0)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
        .frame(width: 414, height: 100)

        }
    }
}

struct UselessInformation_Previews: PreviewProvider {
    static var previews: some View {
        UselessInformationView()
    }
}
