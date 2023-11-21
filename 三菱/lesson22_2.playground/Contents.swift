protocol RandomNumberGenerator{
    //instance method requirements
    func random() -> Double
}

class LinearCongruentialGenerator:RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139958.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
    
}

let generator = LinearCongruentialGenerator()
generator.random()
generator.random()
generator.random()

protocol Togglable{
    //mutating method requirements
    mutating func toggle()
}

enum OnOffSwitch:Togglable{
    case off, on
    mutating func toggle(){
        switch self{
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
lightSwitch.toggle()
