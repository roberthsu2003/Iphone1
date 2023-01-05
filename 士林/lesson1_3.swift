//optional type
var serverResponseCode = 404
//serverResponseCode  =  nil

var surverAnswer:Int? = 404 //明確宣告建立optional type
//surverAnswer = nil
//print(surverAnswer)

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber == nil{
	print("輸入錯誤")
}else{
	//print("轉換成功:" + String(convertedNumber!))
	//字串插補
	print("轉換成功:\(convertedNumber!)")
}

var n = 10
var m = 20
//print("n+m=" + String(n+m))
//字串插補
print("n+m=\(n+m)")

