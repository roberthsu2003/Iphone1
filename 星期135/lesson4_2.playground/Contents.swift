import UIKit

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1:String, _ s2:String) -> Bool{
    return s1 < s2
}

var reverseName = names.sorted(by: backward)
reverseName

//參數使用closure
var reverseName1 = names.sorted(by: {
    (s1:String,s2:String) -> Bool in
    return s1 < s2
})
reverseName1
