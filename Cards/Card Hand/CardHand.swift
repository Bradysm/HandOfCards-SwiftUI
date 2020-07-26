//
//  CardHand.swift
//  Cards
//
//  Created by brady murphy on 7/26/20.
//  Copyright © 2020 Brady Murphy. All rights reserved.
//

import Foundation
import SwiftUI

/**
 Hand of cards to be used within an application utilizing playing cards
 This hand simulates the natural motions that humans take while looking at
 cards in their hand for games such as poker, uno, etc.
 */
struct CardHand: View {
    /// array of card names used for their respective images
    /// this can be expanded to a model for a full card game
    let cards: [PlayingCardInHand]
    
    /// state variable for splaying cards
    @State var splayCards = false
    
    /// state variable defining which
    @State var selectedCard = -1
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(self.cards, id: \.self) {
                    PlayingCard(splayCard: self.$splayCards, selectedCard: self.$selectedCard, card: $0)
                }
            }
            Spacer()
            
            Button(action: { withAnimation {
                self.splayCards.toggle()
                self.selectedCard = -1
                } }) {
                    Text("Splay Cards")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
            }
        }
    }
}
