import UIKit

//function,建立一個功能
//定義function
//呼叫function

//建立一個function
func greet(person:String)->String{
    let greeting = "Hello, \(person)!"
    return greeting
}

//呼叫function
print(greet(person:"Alice"))
