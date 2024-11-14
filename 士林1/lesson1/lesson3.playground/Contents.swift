import UIKit

let possibleNumber = "123a"
let convertedNumber = Int(possibleNumber)
//print(convertedNumber!) //force unwrapping(危險的)

//判斷式解決
if convertedNumber != nil {
    print(convertedNumber!)
}else{
    print("轉換失敗")
}

print(convertedNumber ?? "轉換失敗")


//optional binding
if let number = Int(possibleNumber) {
    print(number)
}

//optional binding 串接

if let fistNumber = Int("4"){
    if let secondNumber = Int("42"){
        if fistNumber < secondNumber && secondNumber < 100{
            print("\(fistNumber)<\(secondNumber)<100")
        }
    }
}

if let fistNumber = Int("4"), let secondNumber = Int("42"), fistNumber < secondNumber && secondNumber < 100{
    print("\(fistNumber)<\(secondNumber)<100")
}

//implicitly optionals type
//自動force unwrapping

let possibleString:String? = "An optional string."
let forcedString:String = possibleString!

//implicitly optionals type
let assumedString:String! = "An implicitly unwrapped optional string."
let implicitString:String = assumedString

assumedString.isEmpty




