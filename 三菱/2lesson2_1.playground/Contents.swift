class Person{
    let name:String
    init(name: String) {
        self.name = name
        print("\(name)的記憶體被建立")
    }
    
    deinit{
        print("\(name)記憶體被釋放")
    }
}

var reference1:Person?
var reference2:Person?
var reference3:Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference2

reference1 = nil
reference2 = nil
reference3 = nil


