import UIKit

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1:String, _ s2:String) -> Bool{
    return s1 < s2
}

var reverseName = names.sorted(by: backward)
reverseName

//參數使用closure標準語法
var reverseName1 = names.sorted(by: {
    (s1:String,s2:String) -> Bool in
    return s1 < s2
})
reverseName1

//簡化closure的語法
var reverseName2 = names.sorted(by: {
    (s1,s2) in s1 < s2
})

reverseName2

var reverseName3 = names.sorted(by: {
      $0 < $1
})

reverseName3

var reverseName4 = names.sorted(by: <)
reverseName4
