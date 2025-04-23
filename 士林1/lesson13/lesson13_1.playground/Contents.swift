import UIKit

protocol SomeProtocal{
    //requirements
    /*
    1. property Requirements
    2. method requirements
    3. initial requirements
     */
    var mustBeSettable:Int {get set}
    var doesNotNeedToBeSettable:Int {get}
    
    
}

struct SomeStruct{
    
}

class SomeClass:UILabel{
    
}


protocol FullyNamed{
    //property requirement
    var fullName:String {get}
}

struct Person:FullyNamed{
    var fullName: String
}

let john:Person = Person(fullName: "John Appleseed")
print(john.fullName)

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name:String, prefix:String?=nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName:String{
        return (prefix != nil ? prefix!+"" : "") + name
    }
    
}


protocol RandomNumberGenerator{
    func random() -> Double
}

class LinearCongruentialGenerator:RandomNumberGenerator{
    private var seed:Int
    private let multiplier:Int = 1664525
    private let increment:Int = 1013904223
    private let modulus:Int = Int(UInt32.max)
    
    init(seed:Int){
        self.seed = seed
    }
    
    func random() -> Double{
        return Double(self.seed) / Double(self.modulus)
    }
    
}
