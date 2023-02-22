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



