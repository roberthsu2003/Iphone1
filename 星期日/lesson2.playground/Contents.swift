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

let possibleNumber = "123"
let convertedNumer = Int(possibleNumber)
convertedNumer! //強制取出變數內的值


//一般的變數

var a1 = 567
var d1 = a1
d1



//optional 變數
var b1:Int? = 567

var c1 = b1;
//c1是optional type
c1

//c2是一般type
var c2 = b1!;
c2










