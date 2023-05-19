import UIKit

//Generic
//inout參數
func swapTwoInts(_ a:inout Int,_ b:inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)

someInt
anotherInt


func swapTwoStrings(_ a:inout String,_ b:inout String){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someString = "3"
var anotherString = "107"

swapTwoStrings(&someString, &anotherString)

someString
anotherString


func swapTwoValues<T>(_ a:inout T,_ b:inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)
someInt
anotherInt

swapTwoValues(&someString, &anotherString)
someString
anotherString



struct IntStack{
    var items:[Int] = []
    
    mutating func push(_ item:Int){
        items.append(item)
    }
    
    mutating func pop() -> Int{
        return items.removeLast()
    }
}

//Generic Types
struct Stack<Element>{
    var items:[Element] = []
    
    mutating func push(_ item:Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.pop()


func swapTwoValues1<T:Hashable>(_ a:inout T,_ b:inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

let myArray = [Int]()
let yourArray = Array<Int>()
