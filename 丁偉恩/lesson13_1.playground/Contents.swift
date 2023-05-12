protocol SomeProtocol{
    var mustBeSettable:Int {get set}
    var doseNotNeedtoBeSettable:Int {get}
}

protocol AnotherProtocol{
    static var someTypeProperty:Int {get set}
}


protocol FullyNamed{
    //property requirements
    var fullName:String{get}
}


struct Person:FullyNamed{
    var fullName:String
}

let john = Person(fullName: "John Appleseed")

class Starship:FullyNamed{
    var fullName:String{
        return "Robert"
    }
}
