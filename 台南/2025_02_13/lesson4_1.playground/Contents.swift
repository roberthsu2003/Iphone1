import UIKit

let possibleNumber = "123a"
let convertedNumber = Int(possibleNumber)

//何時才可以使用force unwrapping
//保證,裏面的值一定不是nil
//print(convertedNumber!)


//如果無法保證,一定先檢查裏面是不是nil
//使用比較運算子(!=)來檢查
if convertedNumber != nil{
    //保證不是nil
    print(convertedNumber!)
}

//使用optional binding來做檢查的動作
if let convertedNumber1 = Int(possibleNumber){
    print(convertedNumber1)
}else{
    print("無法轉換")
}



if let firstNumber=Int("4"), let secondNumber = Int("42"), firstNumber<secondNumber && secondNumber < 100{
    print("\(firstNumber) < \(secondNumber) < 100")
}


if let firstNumber = Int("4"){
    if let secondNumber = Int("42"){
        if firstNumber<secondNumber && secondNumber<100{
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

let possibleString:String? = "An optional string."
let forcedString:String = possibleString!

let assumedString:String! = "An assumed string."
let implicitString:String = assumedString

if let definiteString = assumedString{
    print(definiteString)
}else{
    print("assumedString 是 nil")
}

let age = -3
//debug
assert(age >= 0, "Age一定不能是負數")
