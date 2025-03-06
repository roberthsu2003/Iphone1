import UIKit

let (x, y) = (1, 2)
print(x, y)


var a = 1
a += 2
print(a)

1==2 ? print("ok") : print("ng") //3元運算式

//nil運算子
let defaultColorName = "red"
var userDefineColrName:String?
userDefineColrName = "green"

var colorNameToUse = userDefineColrName ?? defaultColorName

print(colorNameToUse)

//範圍運算子

for index in 1...5{
    print(index)
}


