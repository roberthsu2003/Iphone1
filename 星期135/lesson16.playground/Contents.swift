import UIKit

class Person{
    let name:String
    init(name:String){
        self.name = name
        print("\(name)已經被初始化")
    }
    
    deinit{
        print("記憶體被回收")
    }
}

var reference1:Person?
var reference2:Person?
var reference3:Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference3 = nil
reference2 = nil
reference1 = nil


