import UIKit

//定義function
func greet(person:String) -> String{
    return "Hello, \(person)!"
}

//呼叫function
greet(person:"Alice")

func greetAgain(person:String) -> String{
    return "Hello again,\(person)!"
}

greetAgain(person: "Bob")

func sayHelloWorld() -> String{
    return "Hello, world"
}

sayHelloWorld()

func greet(name:String){
    print("Hello, \(name)")
}

greet(name: "john")
