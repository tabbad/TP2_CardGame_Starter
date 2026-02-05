class Game {
    var player1: ProtocolePlayer
    var player2: ProtocolePlayer
    var deck: Deck

    init(player1: ProtocolePlayer, player2: ProtocolePlayer) {
        self.player1 = player1
        self.player2 = player2
        self.deck = Deck()
        self.deck.shuffle()
    }
    func dealCards() {
        for _ in 0..<26 {
            if let card1 = deck.draw() {
                player1.receiveCard(card1)
            }
            if let card2 = deck.draw() {
                player2.receiveCard(card2)
            }
        }
    }

    func playround() {
        if let card1 = player1.playCard(), let card2 = player2.playCard() {
            print("\(player1.name) plays \(card1.description)")
            print("\(player2.name) plays \(card2.description)")

            if card1 > card2 {
                player1.score += 1
                print("\(player1.name) wins the round!\n")
            } else if card2 > card1 {
                player2.score += 1
                print("\(player2.name) wins the round!\n")
            } else {
                print("It's a tie!\n")
                for _ in 0..<3 {
                    _ = player1.playCard()
                    _ = player2.playCard() 
                }
              
            }
            print("Current Scores: \(player1.name): \(player1.score), \(player2.name): \(player2.score)\n")
        }
    }

    func play() {
        dealCards()
        var i = 0
        while !player1.hand.isEmpty && !player2.hand.isEmpty {
            print("Round \(i + 1):")
            playround()
            i += 1
        }
        print("Final Scores:")
        print("\(player1.name): \(player1.score)")
        print("\(player2.name): \(player2.score)")

        if player1.score > player2.score {
            print("\(player1.name) wins the game!")
        } else if player2.score > player1.score {
            print("\(player2.name) wins the game!")
        } else {
            print("The game is a tie!")
        }
    }
}