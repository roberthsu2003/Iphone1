import UIKit

//建立變數
var currentValue = 0 //使用推測建立資料類型(dataType) Int
currentValue = 100
currentValue = 21

//建立變數,但不先給值
//資料類型的指定

var welcomeMessage:String
welcomeMessage = "Hello!Swift5.0"
print(welcomeMessage)
print("ios")

//建立常數
let pi = 3.14159
//pi = 3.0  //常數內容不可以改變

//使用明確宣告資料類型
let pi1:Float = 4.14159
print(pi)
print("pi是" + String(pi) + ",pi1是" + String(pi1))

//字串插補
print("pi是\(pi),pi1是\(pi1)")


//變數要相同資料類型才可以運算

let meaningOfLife = 42
let pi2 = 3.14159

Double(meaningOfLife) + pi2

Double(meaningOfLife) + 3.14159

let myFloat:Float = 3.23
let myDouble:Double = 4.56

Double(myFloat) + myDouble

//純值不需相同資料類型
3 + 0.14159

//Bool
let isMan = false

//tuple






