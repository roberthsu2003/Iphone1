import UIKit

//引數名稱和參數名稱
func greet(person:String,from hometown:String) -> String{
    return "Hello \(person)! 很高興您拜\(hometown)"
}

greet(person:"robert", from:"Taipei")

//省略引數名稱
func someFunction(_ firstName:Int, secondName:Int){
    
}

someFunction(56, secondName: 78)

//參數有預設的值

func someFunction(a:Int,b:Int=12){
    
}

someFunction(a: 76)

someFunction(a: 76, b:10)
