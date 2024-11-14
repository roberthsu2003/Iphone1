import UIKit

func greet(person:[String:String]){
    guard let name = person["name"] else{
        return
    }
    
    print("Hello, \(name)!")
    
    guard let location = person["location"] else{
        print("I Hope the weather is nice near you.")
        return
    }
    
    print("done")
}

greet(person:["name":"John","location":"New York"])

