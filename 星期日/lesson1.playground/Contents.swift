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



