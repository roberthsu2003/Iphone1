import UIKit

//inout parameter(參數)
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

func swapTwoInts(_ a:inout String,_ b:inout String){
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoInts(_ a:inout Double,_ b:inout Double){
    let temporaryA = a
    a = b
    b = temporaryA
}


//Generic Function
func swapTwoInts<T>(_ a:inout T,_ b:inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt1 = 3
var someAnotherInt = 107

swapTwoInts(&someInt, &someAnotherInt)

var someString = "hello"
var anotherString = "world"
swapTwoInts(&someString, &anotherString)

