//一般變數
let firstValue = 15   //使用者輸入的值
let secondValue = 30  //使用者輸入的值
let sum = firstValue + secondValue
print("加總是:\(sum)")

/*
//使用者有可能輸入輸入超出想像

let firstString = "4a"
let secondStirng = "30"

let firstOptional = Int(firstString)
let secondOptional = Int(secondStirng)

//optional binding
if let first = firstOptional{
    if let second = secondOptional{
        print("加總是:\(first+second)")
    }else{
        print("second有問題")
    }
}else{
    print("first有問題")
}
 */

let firstString = "40"
let secondStirng = "3a"

let firstOptional = Int(firstString)
let secondOptional = Int(secondStirng)

//多個optional binding
if let first = firstOptional, let second = secondOptional{
    print("加總是\(first + second)")
}else{
    print("有錯誤")
}

