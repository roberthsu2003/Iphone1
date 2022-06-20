import UIKit
func greet(person:String, from hometow:String) -> String{
    return "Hello \(person) Glad you could visit from \(hometow)"
}

greet(person: "Bill", from: "台北")

//省略引數名稱

func someFunction(_ firstParameterName:Int, secondParameterName:Int){
    
}
someFunction(1, secondParameterName: 2)
