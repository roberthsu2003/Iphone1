import UIKit

protocol SomeProtocol{
    //property requirements
    var mustBeSettable:Int {get set}
    var deseNotNeedToBeSettable:Int {get}
}


protocol AnotherProtocol{
    static var someTypeProperty:Int {get set}
}

protocol FullyNamed{
    var fullName:String {get}
}

struct Person:FullyNamed{
    var fullName:String
}

let john = Person(fullName: "John Appleseed")
print(john.fullName)

class Starship:FullyNamed{
    var prefix:String?
    var name:String
    init(name:String, prefix:String? = nil){
        self.name = name
        self.prefix = prefix
    }
    
    var fullName:String{
        return (prefix != nil ? prefix! : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

//method Requirements

protocol RandomNumberGenerator{
    func random() -> Double
}

class LinearCongruentialGenerator:RandomNumberGenerator{
    func random() -> Double{
        return 75.234567
    }
}

//initializer Requirements
protocol SomeProtocol1{
    init(someParameter:Int)
}


class SomeClass1:SomeProtocol1{
    required init(someParameter:Int){
        
    }
}
