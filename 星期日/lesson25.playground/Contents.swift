import Darwin
import CoreGraphics
var someInt = 3
var anotherInt = 107

//inout參數
func swapTwoInts(_ a:inout Int,_ b:inout Int){
    let tempararyA = a
    a = b
    b = tempararyA
}

swapTwoInts(&someInt,&anotherInt)
someInt
anotherInt

func swapTwoDoubles(_ a:inout Double,_ b:inout Double){
    let tempararyA = a
    a = b
    b = tempararyA
}

var someDouble = 3.0
var anotherDouble = 107.0

swapTwoDoubles(&someDouble, &anotherDouble)
someDouble
anotherDouble

func swapTwoValues<T:Equatable>(_ a:inout T,_ b:inout T){
    let tempararyA = a
    a = b
    b = tempararyA
}

var someInt1 = 3
var anotherInt1 = 107

swapTwoValues(&someInt1, &anotherInt1)
someInt1
anotherInt1


var someDouble1 = 3.0
var anotherDouble1 = 107.0

swapTwoValues(&someDouble1, &anotherDouble1)
someDouble1
anotherDouble1


//Generic Type
struct IntStack{
    var items:[Int] = []
    mutating func push(_ item:Int){
        items.append(item)
    }
    mutating func pop() -> Int{
        return items.removeLast()
    }
}

struct Stack<T:Equatable>{
    var items:[T] = []
    mutating func push(_ item:T){
        items.append(item)
    }
    mutating func pop() -> T{
        return items.removeLast()
    }
}

Stack(items: [1.0, 2.0, 3.0])
