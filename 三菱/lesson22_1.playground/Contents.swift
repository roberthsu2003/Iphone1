protocol FullyNamed{
    //property requirements
    var fullName:String {get}
}

struct Person:FullyNamed{
    var fullName: String
}

let john = Person(fullName: "John")
john.fullName
