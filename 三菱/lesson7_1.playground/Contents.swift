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
