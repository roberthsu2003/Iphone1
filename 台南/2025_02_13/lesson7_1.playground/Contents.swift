import UIKit

func greet(person:String)->String{
    let greeting = "Hello, \(person)!"
    return greeting
}

greet(person: "Alice")

func greet1(person:String, from hometown:String) -> String {
    return "Hello \(person) Glad you could make it from \(hometown)"
}

greet1(person: "Bill", from: "Cupertino")
