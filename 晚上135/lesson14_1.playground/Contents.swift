protocol SomeProtocol{
    //requirement
    var mustBeSettable:Int {get set}
    var doesNotNeedToBeSettable:Int {get}
}

struct SomeStructure:SomeProtocol{
    var mustBeSettable: Int
    var doesNotNeedToBeSettable: Int{
        return 50
    }
    
}

protocol FullyNamed{
    var fullName:String {get}
}

struct Person:FullyNamed{
    var fullName: String
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
        return (prefix != nil ? prefix! + " " : "") + name
    }
    
}
