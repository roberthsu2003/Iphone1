import UIKit

let names = ["Chris", "Alex", "Eva", "John", "Mary", "Bob"]

func backward(_ s1:String,_ s2:String) -> Bool{
    return s1 < s2
}

names.sorted(by:backward)

//使用closure
names.sorted(
    by:{(s1:String,s2:String)->Bool in
        return s1 > s2}
    )
