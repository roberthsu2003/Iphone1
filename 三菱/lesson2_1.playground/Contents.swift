var greeting = "Hello, playground"
let possibleNumber = "123a"
let convertedNumber = Int(possibleNumber)
//print(convertedNumber!)
//使用if檢查
if convertedNumber != nil{
    print(convertedNumber!)
}else{
    print("資料為nil,轉換錯誤")
}
