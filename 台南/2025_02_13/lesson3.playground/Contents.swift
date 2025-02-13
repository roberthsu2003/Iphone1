import UIKit

//optional type
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil

//nil不可以執行任何東西
//serverResponseCode.description


//optional type
let possibleNumber1 = "123"
let convertedNumber1 = Int(possibleNumber1)

if convertedNumber1 == nil{
    print("轉換失敗")
}else{
    print("轉換成功")
    print(convertedNumber1!) //force unwrapping
}



