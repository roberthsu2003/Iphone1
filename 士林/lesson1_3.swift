//optional type
var serverResponseCode = 404
//serverResponseCode  =  nil

var surverAnswer:Int? = 404 //明確宣告建立optional type
//surverAnswer = nil
//print(surverAnswer)

let possibleNumber = "123a"
let convertedNumber = Int(possibleNumber)

if convertedNumber == nil{
	print("輸入錯誤")
}else{
	print("轉換成功")
	print(convertedNumber!)
}

