import UIKit

//function
func greet(person:String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

greet(person: "Anna")

func greetAgain(person:String) -> String{
    return "Hello again, \(person) !"
}

print(greetAgain(person: "Anna"))

func sayHelloWorld() -> String{
    return "Hello, World!"
}

func greet(person:String, alreadyGreeted:Bool) -> String{
    if alreadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

/*
 func greet(person:String){
 print("Hello, \(person) !")
 }
 */

//傳出多個值
func minMax(array:[Int]) -> (min:Int, max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1...]{
        if value < currentMin{
            currentMin = value
        }
        if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

let (min, max) = minMax(array: [8, -6, 2, 109, 3, 71])
print("Min: \(min), Max: \(max)")

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
bounds.min
bounds.max


//傳出多個值-optional type
func minMax(array1:[Int]) -> (min:Int, max:Int)?{
    if array1.isEmpty{
        return nil
    }
    var currentMin = array1[0]
    var currentMax = array1[0]
    for value in array1[1...]{
        if value < currentMin{
            currentMin = value
        }
        if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

if let bounds = minMax(array1: [8, -6, 2, 109, 3, 71]){
    print("最小是 \(bounds.min), 最大是 \(bounds.max)")
}else{
    print("Empty Array")
}
func abc(){
    guard let bounds = minMax(array1: [8, -6, 2, 109, 3, 71]) else{
        print("Empty Array")
        return
    }
    print("最小是 \(bounds.min), 最大是 \(bounds.max)")
}

abc()

//參數名稱
//引數名稱

func greeting(for person:String) -> String{
    "Hello, \(person) !" //參數名稱
}

greeting(for: "Dave")


func someFunction(firstParameterName:Int, secondParameterName:Int){
    
}

someFunction(firstParameterName: 1, secondParameterName: 3)

func someFunction(argumentLabel parameterName:Int){
    
}


someFunction(argumentLabel: 1)

func greet(person:String, from hometown:String) -> String{
    "Hello, \(person)!  I'm from \(hometown)."
}

greet(person: "Bill", from: "Cupertino")

//省略引數名稱
func someFunction(_ firstParameterName:Int, secondParameterName:Int){
    
}

someFunction(5, secondParameterName: 6)

//預設參數的值
func someFunction(parameterWithoutDefault:Int, ParameterWithDefault:Int = 2){
    
}

someFunction(parameterWithoutDefault: 1)
someFunction(parameterWithoutDefault: 1, ParameterWithDefault: 3)

func arithmeticMean(_ numbers:Double...) -> Double{
    var total:Double = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(4, 5, 6, 7, 8)









