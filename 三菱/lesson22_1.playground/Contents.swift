protocol FullyNamed{
    //property requirements
    var fullName:String {get}
}

struct Person:FullyNamed{
    var fullName: String
}

let john = Person(fullName: "John")
john.fullName


class Starship:FullyNamed{
    var prefix:String?
    var name:String
    init(name:String, prefix:String?=nil){
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String{
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship.init(name: "Enterprise", prefix: "USS")
ncc1701.fullName


