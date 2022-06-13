import Foundation

//透過推測內容指定資料類型
var greeting = "Hello, playground"
print(greeting)

let maximum = 10
var currentLogin = 0
print(maximum)
print(currentLogin)

var x = 0.0, y = 0.0, z = 0.0
print(x)
print(y)
print(z)

//明確宣告資料類型
var welcomeMessage:String
welcomeMessage = "Hello"

//一個變數宣告完成，必需要有明確的變數名稱和資料類型
//var welcomeMessage1  -> 這是錯誤的建立變數

var red, green, blue:Double
var red1 = 0.0

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "swift"
//languageName = "swift++" ->常數不可以改變內容

var value = 321
print("value內儲存的內容是:" + String(value))

var apple = 3
var orange = 5
print("apple有" + String(apple) + "個,orange有" + String(orange) + "個")

//字串插補
print("apple有\(apple)個,orange有\(orange)個")







