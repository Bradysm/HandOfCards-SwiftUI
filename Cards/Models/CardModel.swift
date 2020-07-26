//
//  CardModel.swift
//
//  Created by brady murphy on 7/26/20.
//  Copyright © 2020 Brady Murphy. All rights reserved.
//

import Foundation

/// protocol for cards used within a hand of cards
/// all cards must have a card name to ensure an image is displayed
protocol CardType {
    var cardName: String { get }
}


/// protocol used for a card within a hand of cards
/// this gives the position of the card within the hands
protocol CardInHandType {
    var cardIndex: Int { get }
    var totalCards: Int { get }
}


/// model used to represent a card in a hand of cards
struct PlayingCardInHand: CardType, CardInHandType, Hashable {
    /// card hand position
    var cardIndex: Int
    var totalCards: Int
    
    /// name
    var cardName: String
    
    /// add more fields for card values
}


//MARK: - Example cards usd within the application
fileprivate let numberOfExampleCards = 7
let examplePlayingCards: [PlayingCardInHand] = (0..<numberOfExampleCards).map { PlayingCardInHand(cardIndex: $0, totalCards: numberOfExampleCards, cardName: "aceSpades")}
