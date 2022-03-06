protocol SomeProtocol{
    var mustBeSettable:Int {get set}
    var doesNotNeedToBeSettable:Int {get}
}

protocol AnotherProtocol{
    static var someTypeProperty:Int {get set}
}


protocol FullyNamed{
    var fullName:String {get} //property 需求
}

struct Person:FullyNamed{
    var fullName: String //store property
}

var john = Person(fullName: "John Appleseed")
john.fullName = "Robert Hsu"

class Starship:FullyNamed{
    var prefix:String?
    var name:String
    init(name:String, prefix:String? = nil){
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String{
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName
