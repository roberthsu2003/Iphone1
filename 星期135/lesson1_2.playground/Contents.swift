import UIKit

var greeting = "Hello, playground"
//整數
Int.min
Int.max

Int64.min
Int64.max

UInt.min
UInt.max

Int8.min
Int8.max

UInt8.min
UInt8.max

var value:UInt = 678
value

var pi1 = 3.14
var pi2:Float = 3.14159
var pi3:Double = 3.14159786543

let anotherPi = 3 + 0.14159
var one:UInt = 15
//let anotherOne = one + 3.14159

// let cannotBeNegative:UInt8 = -1
// let tooBig:Int8 = Int8.max + 1

let twoThousand:UInt16 = 2_000
let one1:UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one1)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi4 = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi4)

//Bool
let YES = true
let No = false

//tuple
let http404Error = (404, "Not Found")
let http200Ok = (200, "OK")

//如何取出tuple的值,使用索引
http404Error.0
http404Error.1

//折解tuple到變數內
let (statusCode, statusMessage) = http404Error
statusCode
statusMessage

//建立有label的tuple

let http200Status = (status:200, description:"OK")
http200Status.status
http200Status.description



