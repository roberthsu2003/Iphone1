
class Person{
    let name:String
    init(name: String) {
        self.name = name
    }
    
    var apartment:Apartment?
    deinit{
        print("\(name)記憶體被釋放")
    }
}

class Apartment{
    let unit:String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant:Person?
    deinit{
        print("\(unit)記憶體被釋放")
    }
}

var john:Person?
var unit4A:Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

john = nil
unit4A = nil

