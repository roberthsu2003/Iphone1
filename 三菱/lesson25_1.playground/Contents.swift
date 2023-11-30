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
