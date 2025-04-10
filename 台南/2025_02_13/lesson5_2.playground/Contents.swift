import UIKit

//switch
//符合值的功能

let someCharacter:Character = "z"

switch someCharacter {
case "a":
    print("a")
case "b":
    print("b")
default:
    print("不是a和b")
}

let anotherCharacter:Character = "a"

//組合
switch anotherCharacter {
case "a", "b":
    print("a或b")
default:
    print("不是a和b")
}

//case後面可以使用範圍運算子
let approximateCount:Int = 876

switch approximateCount {
case 0:
    print("0")
case 1..<5:
    print("1~4")
case 5..<12:
    print("5-11")
case 12..<100:
    print("12-99")
case 100..<1000:
    print("100-999")
default:
    print("大於1000")
          
}

//tuple
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0)")
case (_, 0):
    print("y軸")
case (0, _):
    print("x軸")
case(-2...2, -2...2):
    print("正方形")
default:
    print("其他點")
}



