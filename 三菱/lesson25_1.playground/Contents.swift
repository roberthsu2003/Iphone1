import UIKit

func swapTwoInts(_ a:inout Int,_ b:inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}






func swapTwoStrings(_ a:inout String,_ b:inout String){
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a:inout Double,_ b:inout Double){
    let temporaryA = a
    a = b
    b = temporaryA
}

//利用generic function解決這樣的問題
//generic function
func swapTwoValues<T>(_ a:inout T,_ b:inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoValues(&someInt, &anotherInt)
print(someInt, anotherInt)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

print(someString, anotherString)


struct IntStack{
    var items = [Int]()
    mutating func push(_ item:Int){
        items.append(item)
    }
    
    mutating func pop() -> Int{
        return items.removeLast()
    }
}

//generic Type
struct Stack<Element>{
    var items = [Element]()
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
stackOfStrings.push("cuatro")

stackOfStrings.pop()

var stackOfInts = Stack<Int>()

stackOfInts.push(5)
stackOfInts.push(10)
stackOfInts.pop()

//擴充Generic Type
//extendtion Generic Type

extension Stack{
    var topItem:Element? {
        return items.isEmpty ? nil : items[items.count-1]
    }
}

if let topItem = stackOfStrings.topItem{
    print(topItem)
}

//型別的限定
/*
func findIndex(ofString valueToFind:String, in array:[String]) -> Int?{
    for (index,value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}
 */

func findIndex<T:Equatable>(of valueToFind:T, in array:[T]) -> Int?{
    for (index,value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(of: "llama", in: strings){
    print(foundIndex)
}

findIndex(of: 9.3, in: [3.14159, 0.1, 9.3])




