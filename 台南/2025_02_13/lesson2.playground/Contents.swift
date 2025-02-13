import UIKit

//Int
//Int8, Int16, Int32, Int64

//UInt
//UInt8, UInt16, UInt32, UInt64

let a: Int8 = 127

Int8.max
Int8.min

Int.max
Int.min

let twoThousand:UInt32 = 20_000_000
let one:UInt8 = 1
let twoAndone = twoThousand + UInt32(one)

//定義型別的小名
typealias AudioSample = UInt32

let twoThousands:AudioSample = 20_000_000
let ones:UInt8 = 1
let twoAndones = twoThousand + AudioSample(one)




