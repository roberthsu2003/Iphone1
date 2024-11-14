import UIKit

func greet(person:[String:String]){
    guard let name = person["name"] else{
        print("沒有key:name")
        return
    }
    
    print("Hello, \(name)!")
    
    guard let location = person["location"] else{
        print("I Hope the weather is nice near you.")
        return
    }
    
    print("done")
}
//greet(person:[:])

greet(person:["name":"John"])

//greet(person:["name":"John","location":"New York"])

