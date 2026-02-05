final class HumanPlayer : ProtocolePlayer {
    var name: String
    var hand: [Card]
    var score: Int

    init(name: String) {
        self.name = name
        self.hand = []
        self.score = 0
    }

    func playCard() -> Card? {
        return hand.popLast()
    }

    func receiveCard(_ card: Card) {
        hand.append(card)
    }
}