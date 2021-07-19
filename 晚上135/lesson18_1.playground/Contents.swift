struct BlackjackCard{
    enum Suit:Character{
        case spades = "♠"
        case hearts = "♡"
        case diamonds = "♢"
        case clubs = "♣"
    }
    
    enum Rank:Int{
        case two=2, three,four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values{
            let first:Int, second:Int?
        }
        
        var values:Values{
            switch self{
            case .ace:
                return Values(first: 1, second: 11)
            case .jack,.queen,.king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank:Rank, suit:Suit
    var description:String{
        var output = "suit is \(suit.rawValue)"
        output += "value is \(rank.values.first)"
        if let second = rank.values.second{
            output += "or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades:\(theAceOfSpades.description)")
BlackjackCard.Suit.hearts.rawValue

extension Double{
    var km:Double { return self * 1_000.0}
}
let oneKm = 25.4.km
oneKm

