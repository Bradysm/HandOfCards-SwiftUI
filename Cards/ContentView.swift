//
//  ContentView.swift
//  Cards
//
//  Created by brady murphy on 7/12/20.
//  Copyright © 2020 Brady Murphy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardHand(cards: examplePlayingCards)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone X")
    }
}
