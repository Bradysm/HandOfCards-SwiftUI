//
//  PlayingCard.swift
//  Cards
//
//  Created by brady murphy on 7/26/20.
//  Copyright © 2020 Brady Murphy. All rights reserved.
//

import SwiftUI


extension CardHand {
    
    /**
     Playing card within a CardHand
     */
    struct PlayingCard: View {
        @Binding var splayCard: Bool
        @Binding var selectedCard: Int
        
        /// card model
        var card: PlayingCardInHand
        
        var body: some View {
            GeometryReader { geo in
                Image(self.card.cardName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(3)
                    .shadow(color: self.cardShadow, radius: 12, x: 2, y: 2)
                    .rotationEffect(.init(degrees:(self.splayCard && !self.isCardSelected ? self.splayRotationAngle : 0)), anchor: .bottom)
                    .offset( y: (self.isCardSelected ? -200 : 0))
                    .onTapGesture {
                        withAnimation {
                            self.selectedCard = (self.isCardSelected ? -1 : self.card.cardIndex )
                        }
                }
            }
            .frame(width: 130, height: 160)
            
        }
        
        /**
         Computes the color of the shadow behind the card
         When the cards are now splayed, only show the shadow of the top card, otherwise,
         show the shadow of the card
         */
        private var cardShadow: Color {
            return Color.gray.opacity((self.splayCard || self.card.cardIndex == 0 ? 0.6 : 0))
        }
        
        /**
         Computed value determining if the card is the current card selected
         If the card is the current card selected, then true is returned, otherwise
         false is returned
         */
        private var isCardSelected: Bool {
            return (self.card.cardIndex == self.selectedCard)
        }
        
        /// computes the rotation angle of the card within the hand when selected
        private var splayRotationAngle: Double {
            let multiplier = 100 / Double(self.card.totalCards)
            let subtractionDegree = Double(self.card.cardIndex) * multiplier
            let totalCardSplayAngle = 90.0
            return (totalCardSplayAngle / 2.0) - subtractionDegree
        }
    }
}
