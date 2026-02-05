protocol ProtocolePlayer : AnyObject {
var name: String { get }    
var hand: [Card] { get set }
var score: Int { get set }
func playCard() -> Card?
func receiveCard(_ card: Card)
}