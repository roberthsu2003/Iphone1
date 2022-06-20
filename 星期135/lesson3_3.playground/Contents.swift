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
func greet(person1:String){
    print("Hello! \(person1)")
}

greet(person1: "jenny")

//可傳出多個值的function
func minMax(array:[Int]) -> (min:Int, max:Int){
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

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
bounds.min
bounds.max

func minMax(array1:[Int]) -> (min:Int, max:Int)?{
    if array1.isEmpty { return nil }
    var currentMin = array1[0]
    var currentMax = array1[0]
    for value in array1[1...]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//optional binding
if let bounds1 = minMax(array1: [Int]()){
    bounds1.min
    bounds1.max
}else{
    print("function出錯了")
}

//參數名稱和引數名稱都為同一個
func someFunction(firstParameterName:Int, secondParameterName:Int){
    
}

someFunction(firstParameterName: 1, secondParameterName: 2)

//同時參數名稱和引數名稱
func someFunction(argumentLabel parameterName:Int){
    //只可以使用參數名稱
}
//呼叫時使用引數名稱
someFunction(argumentLabel: 1)








