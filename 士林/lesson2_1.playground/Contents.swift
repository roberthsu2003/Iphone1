import UIKit

var n = 10  //推測

var i:Int  = 20

//5個分數
/*
var name="徐國堂"
var chinese = 78
var english = 78
var math = 90
 */

var students = ("徐國堂", 78, 80, 90)

let (name,chinese,english,math) = students
name
chinese
english
math
/*
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

5 == 5
5 != 5

if convertedNumber != nil{
    print("轉換成功,值為\(convertedNumber!)")
    
}else{
    print("轉換失敗")
}
*/

//optional binding
let possibleNumber = "123"
if let convertedNumber = Int(possibleNumber){
    print("轉換成功,值為\(convertedNumber)")
}else{
    print("轉換失敗")
}






