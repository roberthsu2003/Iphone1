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

let somePoint = (1, 1)
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



