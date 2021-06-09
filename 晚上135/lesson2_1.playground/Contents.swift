//明確宣告
var welcomeMessage:String = "Hello"

//不明確宣告
var welcomeMessage1 = "Hello"

let pi = 3.14159

//純值的數值運算可以自動轉型
let anotherPi = 3 + 0.14159

let first = 3
let second = 0.14159

//變數值要手動轉型
let otherPi = Double(first) + second

//建立tuple
//let http404Error:(Int,String) = (404,"Not Found")
let http404Error = (404, "Not Found")

//取出tuple的值,使用索引
http404Error.0
http404Error.1

//取出值,使用拆解法
let (statusCode, statusMessage) = http404Error
statusCode
statusMessage

//建立tuple,使用標籤
let http200Status = (statusCode:200,description:"Ok")
http200Status.statusCode
http200Status.description




