var greeting = "Hello, playground"
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//print(convertedNumber!)
//使用if檢查
if convertedNumber != nil{
    print(convertedNumber!)
}else{
    print("資料為nil,轉換錯誤")
}

//使用optional binding檢查
if let actualNumber = Int(possibleNumber){
    print(actualNumber)
}else{
    print("資料為nil,轉換錯誤")
}
