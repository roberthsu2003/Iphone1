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
