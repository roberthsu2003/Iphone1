import UIKit

let possibleNumber = "123"  //這個絕對是可以轉成整數的
let convertedNumber = Int(possibleNumber)
print(convertedNumber!) //我保證,裏面絕對不會是nil

let possibleNumber1 = "123a" //這是使用者輸入的
let convertedNumber1 = Int(possibleNumber1)

//無法確認使用者輸入的內容可不可以轉成整數
//檢查內容是否為nil
//使用if檢查

if convertedNumber1 == nil {
    print("轉換失敗")
}else{
    print(convertedNumber1!)
}

let possibleNumber2 = "123"
//let convertedNumber2:Int = Int(possibleNumber2) 會出錯,資料類型不一樣

let possibleNumber3 = "123" //這是使用者輸入的
if let convertedNumber3 = Int(possibleNumber3){
    print("使用optional binding 檢查的結果\(convertedNumber3)")
}else{
    print("轉換失敗")
}

