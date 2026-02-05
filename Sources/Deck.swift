

final class Deck{

    var cards: [Card]
    init() {
        self.cards = []
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                let card = Card(rank: rank, suit: suit)
                self.cards.append(card)
            }
        }
    }

    func shuffle() {
        self.cards.shuffle()
    }
    func draw() -> Card? {
        return self.cards.popLast()
    }
    func reset() {
        self.cards.removeAll()
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                let card = Card(rank: rank, suit: suit)
                self.cards.append(card)
            }
        }
    }
}