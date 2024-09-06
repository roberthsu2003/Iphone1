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

