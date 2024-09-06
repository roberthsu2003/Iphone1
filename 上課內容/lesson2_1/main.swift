let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
/*
1.//保證內容不會是nil
print(convertedNumber!)
*/

//不確定是nil,使用if來檢查
if convertedNumber != nil{
	print(convertedNumber!)
}


//不確定是nil,使用optional Binding

let possibleNumber1 = "123"
if let convertedNumber1 = Int(possibleNumber){
	print("使用optional binding:\(convertedNumber1)")
}

if let firstNumber = Int("4"){
	if let secondNumber = Int("42"){
		if firstNumber < secondNumber && secondNumber < 100{
			print("\(firstNumber) < \(secondNumber) < 100")
		}
	}
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100{
	print("\(firstNumber) < \(secondNumber) < 100")
}


let possibleString:String? = "An optional string."
let forcedString:String = possibleString!

let assumedString:String! = "An implicitly unwrapped optional String."
let implicitString:String = assumedString


let defaultColorName = "red"
var userDefinedColorName:String?

var  colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)
