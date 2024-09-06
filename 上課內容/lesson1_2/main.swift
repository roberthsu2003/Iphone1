let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

/*
錯誤的
//let cannotBeNegative:UInt8 = -1
//let tooBig:Int8 = Int8.max + 1
*/


let twoThousand:UInt16 = 2_000
let one:UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
print(pi)

//tuple
let http404Error = (404, "Not Found")
print(http404Error)

//拆解法
let (statusCode, statusMessage) = http404Error
print(statusCode)
print(statusMessage)

let (justTheStatusCode, _) = http404Error
print(justTheStatusCode)

//透過索引編號
print(http404Error.0)
print(http404Error.1)

//透過key
let http200Status = (statusCode:200, description:"ok")
print(http200Status.statusCode)
print(http200Status.description)

//optional type
let possibleNumber = "123a"
let convertedNumber = Int(possibleNumber)
print(convertedNumber)

//nil
var serverResponseCode:Int? = 404
serverResponseCode = nil
print(serverResponseCode)

//如果使用optional type,不給值,會有default value nil
var surverAnswer:String?

print(surverAnswer)

//optional type
let possibleNumber1 = "123a"
let convertedNumber1 = Int(possibleNumber1)
if convertedNumber1 != nil{
	print(convertedNumber1!)
}else{
	print("無法轉換")
}



let serverResponseCode1:Int? = 404
print(serverResponseCode1!)





