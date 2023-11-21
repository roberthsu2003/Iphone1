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


protocol SomeProtocol{
    //initalizer requirements
    init(someParameter:Int)
}

class SomeClass:SomeProtocol{
    required init(someParameter:Int){
        
    }
}

protocol SomeProtocol1{
    init()
}

class SomeSuperClass{
    init(){
        
    }
}

class SomeSubClass:SomeSuperClass,SomeProtocol1{
    required override init(){
        
    }
}

class Dice{
    let sides:Int
    //使用protocol的型別
    let generator:RandomNumberGenerator
    
    init(sides:Int, generator:RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int{
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5{
    print(d6.roll())
}


