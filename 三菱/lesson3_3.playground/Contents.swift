//substrings

let greeting = "Hello! world!"
/*
 #optional binding
if let index = greeting.firstIndex(of: ","){
    greeting[..<index]
}else{
    print("沒有,號")
}
 */
/*
 #沒有檢查
let index = greeting.firstIndex(of: ",")
greeting[..<index!]
 */

//使用nil運算子
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
greeting[..<index]

