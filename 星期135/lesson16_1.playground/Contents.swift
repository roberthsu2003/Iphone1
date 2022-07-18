import UIKit

class Person{
    let name:String
    init(name:String){
        self.name = name
    }
    var apartment:Apartment?
    deinit{
        print("\(name)記憶體已經回收")
    }
}

class Apartment{
    let unit:String
    init(unit:String){
        self.unit = unit
    }
    var tenant:Person?
    deinit{
        print("Apartment \(unit) 記憶體已經回收")
    }
}

var john:Person?
var unit4A:Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

