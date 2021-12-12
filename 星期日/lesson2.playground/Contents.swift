//名稱tuple
//建立tuple,(Int,String)
let http404Error = (404, "Not Found")

//折解法取出tuple值
let (statusCode, statusMessage) = http404Error

statusCode
statusMessage

//使用索引編號取出值
http404Error.0
http404Error.1

let point = (51.3,89.7)
let (x,y) = point
x
y
point.0
point.1

//optional type
/*
var myValue = 50
myValue = nil
 */

//明確建立optional type,宣告資料類型
var myValue:Int? = 50;
myValue = nil







