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

func minMax(array:[Int]) -> (min:Int,max:Int)?{
    if array.isEmpty{
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1...]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array:[8, -6, 2, 109, 3, 71]){
    print(bounds.min)
    print(bounds.max)
}


