struct BlackjackCard{
    enum Suit:Character{
        case spade = "♠"
        case heart = "♡"
        case diamonds = "♢"
        case clubs = "♣"
    }
    
    enum Rank:Int{
        case two = 2,three, four, five, six, seven, eight, nine, ten
        case jack, queen, king , ace
        
        struct Value{
            let first:Int, second:Int?
        }
        
        var values:Value{
            switch self{
            case .ace:
                return Value(first: 1, second: 11)
            case .jack, .queen, .king:
                return Value(first: 10, second: nil)
            default:
                return Value(first: self.rawValue, second: nil)
            }
        }
    }
    
    let suit:Suit
}



