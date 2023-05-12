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

protocol SomeProtocol1{
    //method requirements
    func random() -> Double
}


class LinearCongruentialGenerator:SomeProtocol1{
    func random() -> Double{
        return 56.789
    }
}

protocol someProtocol2{
    init(someParameter:Int)
}

class SomeClass:someProtocol2{
    required init(someParameter: Int) {
        
    }
}

protocol DiceGame{
    var dice:Int{get}
    func play()
}

class SnakesAndLadders{
    var delegate:DiceGame?
}

class Abc:DiceGame{
    var dice:Int = 5
    func play(){
        //dosomeThine
    }
}

var snack = SnakesAndLadders()
snack.delegate = Abc()
