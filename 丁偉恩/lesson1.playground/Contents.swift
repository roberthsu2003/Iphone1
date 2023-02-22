var i = 10 //推測
var j:Int = 20


var n:Float = 12.5 //明確宣告

Float(i) + n

//optional type
let possibleNumber = "123a"
if let convertedNumber = Int(possibleNumber){
    print(convertedNumber)
}else{
    print("轉換有誤")
}
/*
if convertedNumber == nil{
    print("轉換有誤")
}else{
    print(convertedNumber!)
}
 */

if let firstNumber = Int("4"){
    if let secondNumber = Int("42"){
        if firstNumber < secondNumber && secondNumber < 100{
            print("\(firstNumber)<\(secondNumber)<100")
        }
    }
}

if let firstNumber = Int("4"),let secondNumber = Int("42"),firstNumber < secondNumber && secondNumber < 100{    
    print("\(firstNumber)<\(secondNumber)<100")
}



