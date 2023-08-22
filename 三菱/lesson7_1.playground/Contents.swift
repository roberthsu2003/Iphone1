let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1:String, _ s2:String) -> Bool{
    return s1 > s2
}
var reversedName = names.sorted(by: backward)

var reverseName1 = names.sorted(by: {
    (s1:String, s2:String)->Bool in
    return s1 < s2
})

//推測參數的資料型別
var reverseName2 = names.sorted(by: {
    (s1, s2) in
    return s1 < s2
})

//如果單獨一行運算式可以自動return
var reverseName3 = names.sorted(by: {
    (s1, s2) in s1 < s2
})

//不寫參數,$0,$1來替代
var reverseName4 = names.sorted(by: {
      $0 < $1
})

//operator method

var reverseName5 = names.sorted(by: < )

//在最後的colsure
//trailing closure
//使用trailing closure,引數名稱可以省略
names.sorted(){
    (s1:String, s2:String)->Bool in
    return s1 < s2
}

//trailing closure,如果只有一個參數,可以省略()
names.sorted{
    (s1:String, s2:String)->Bool in
    return s1 < s2
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

//trailing closure
numbers.map{
    (number:Int)->String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    }while(number > 0)
    return output
}
