import UIKit

let someCharacter: Character = "c"

switch someCharacter {
case "a":
    print("The first letter is 'a'")
case "z":
    print("It's a 'z'")
default:
    print("It's not an 'a' or a 'z'")
}

//group
let someCharacter1: Character = "A"

switch someCharacter1 {
case "a","A":
    print("The first letter is 'a'")
case "z":
    print("It's a 'z'")
default:
    print("It's not an 'a' or a 'z'")
}

//range operator
let approximateCount = 62
switch approximateCount{
case 0:
    print("Zero")
case 1..<5:
    print("1~4")
case 5..<12:
    print("5~11")
case 12..<100:
    print("12-99")
case 100..<1000:
    print("100-999")
default:
    print("More than 1000")
}

let somePoint = (1, 3)
switch somePoint {
case (0, 0):
    print("The origin")
case (_, 0):
    print("On the x-axis")
case (0, _):
    print("On the y-axis")
case (-2...2, -2...2):
    print("Inside the square")
default:
    print("Outside the square")
}

//Value Bindings
let anotherPoint = (1, 3)
switch anotherPoint {
case (let x, 0):
    print("On the x-axis with value \(x)")
case (0, let y):
    print("On the y-axis with value \(y)")
case let (x, y):
    print("At (\(x), \(y))")
}

//where
let yetAnotherPoint = (1, 1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is at a 相同的")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is at an 相反的")
case let(x,y):
    print("(\(x), \(y)) is not at a diagonal or antidiagonal")

}






