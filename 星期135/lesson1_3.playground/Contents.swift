//optional type

var serverResponseCode:Int
//serverResponseCode
var serverResponseCode1:Int?
//print(serverResponseCode1!) -> nil使用force unwrapping會出錯

serverResponseCode1 = 404
print(serverResponseCode1!)

let possibleNumber = "123"
let converedNumber = Int(possibleNumber)
if converedNumber == nil{
    print("無法轉換")
}else{
    print(converedNumber!)
}



