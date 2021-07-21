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
