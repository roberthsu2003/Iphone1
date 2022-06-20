import UIKit
func greet(person:String, from hometow:String) -> String{
    return "Hello \(person) Glad you could visit from \(hometow)"
}

greet(person: "Bill", from: "台北")

//省略引數名稱

func someFunction(_ firstParameterName:Int, secondParameterName:Int){
    
}
someFunction(1, secondParameterName: 2)

//參數可以有default value
//呼叫的方式變多了

func someFunction(parameterWithoutDefault:Int, parameterWithDefault:Int=12){
    
}
someFunction(parameterWithoutDefault: 10)
someFunction(parameterWithoutDefault: 10, parameterWithDefault: 15)

//沒有限定數量的參數
func arithmeticMean(_ numbers:Double...) -> Double{
    var total:Double = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5,6,7)
arithmeticMean(4,8,8.4,9.2,1.1)


