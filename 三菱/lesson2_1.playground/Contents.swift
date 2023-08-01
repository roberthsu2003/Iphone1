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

if let firstNumber = Int("4"){
    if let secondNumber = Int("42"){
        if firstNumber < secondNumber && secondNumber < 100{
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

if let firstNumber = Int("4"),let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

//implicit optional type
let possibleString:String? = "An optional string."
let forcedString = possibleString!

let assumedString:String! = "An implicitly unwrapped optional String."

let implicitString = assumedString
print(implicitString)

let implicitString1 = assumedString!
print(implicitString1)

let implicitString3:String = assumedString
print(implicitString3)

if assumedString != nil{
    print(assumedString!)
}

if let definiteString = assumedString{
    print(definiteString)
}

if let assumedString = assumedString{
    print(assumedString)
}

func canThrowAnError() throws{
    
}

//canThrowAnError()

do{
    try canThrowAnError()
}catch{
    
}


