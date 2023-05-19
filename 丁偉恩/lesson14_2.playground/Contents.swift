class Person{
    let name:String
    init(name:String){
        self.name = name
        print("\(name)被初始化")
    }
    
    deinit{
        print("\(name)被消滅")
    }
}
var reference1:Person?
var reference2:Person?
weak var reference3:Person?

reference1 = Person(name:"robert")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3

