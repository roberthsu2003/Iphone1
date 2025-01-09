import UIKit

var greeting = "Hello, playground"
print(greeting)

//建立變數
var myVariable = 42
print(myVariable)

myVariable = 100
myVariable = 101

//建立常數
let myConstant = 42

//常數不可以改變裏面的值
//myConstant = 100

let implicitInteger = 70 //透過純值推測資料類型
let implicitDouble = 70.0 //透過純值推測資料類型
let explicitDouble: Double = 70 //明確告知資料類型

let label = "The width is "
let width = 94

label + String(width)

/*
var x = 0.0
var y = 0.0
var z = 0.0
*/

var x = 0.0, y = 0.0, z = 0.0
print(x, y, z)

//明確宣告(type annotation)
//var welcomeMessage:String
//welcomeMessage = "Hello World!"

//明確宣告,同時給值
//var welcomeMessage:String = "Hello World!"

//透過推測,給予資料類型
var welcomeMessage = "Hello World!"

//"Robert! " + welcomeMessage

//透過字串插補(string interpolation)
"Robert! \(welcomeMessage)"

"Roboert! \(1)"

"Roboert! \(25.54)"









