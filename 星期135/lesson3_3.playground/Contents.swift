import UIKit
func greet(person:String) -> String{
    let greeting = "Hello," + person + "!"
    return greeting
}

greet(person: "Robert")
greet(person: "Jenny")

//沒有參數是function

func sayHelloWorld() -> String{
    return "hello!world!"
}

sayHelloWorld()

//多個參數的function
func greet(person:String, alreadyGreeted:Bool) -> String{
    if alreadyGreeted{
        return "已經打過招呼"
    }else{
        return greet(person: person)
    }
}

greet(person: "Tim", alreadyGreeted: false)

//沒有傳出值的function
func greet1(person:String){
    print("Hello! \(person)")
}

greet1(person: "jenny")



