import UIKit

//function,建立一個功能
//定義function
//呼叫function

//建立一個function
func greet(person1:String)->String{
    let greeting = "Hello, \(person1)!"
    return greeting
}

//呼叫function
print(greet(person1:"Alice"))

//提早離開function
//guard....else

func greet(person:String?=nil, location:String?=nil){
    guard let name = person else{
        return
    }
    print("您好:\(name)")
    
    guard let location = location else{
        return
    }
    print("希望您在:\(location)")
}

greet(person:"Bob",location: "台北")
