import UIKit

let names = ["Caleb", "John", "Mike", "Tim", "Joe", "Ben", "Adam", "Chris", "Dave", "Eric", "Frank", "Gary", "Howard", "James", "John", "Kevin", "Larry", "Michael", "Patrick", "Robert", "Stephen", "Tim", "William"]

names.sorted(by:{(s1:String, s2:String) -> Bool in
                return s1 < s2
                })


//省略資料類型
names.sorted(by:{(s1,s2) in s1 < s2})

//省略參數
names.sorted(by:{$0 < $1})

//省略參數
names.sorted(by: < )



//trailing Closuer
names.sorted(by:){(s1:String, s2:String) -> Bool in
    return s1 < s2
}

names.sorted(){(s1:String, s2:String) -> Bool in
    return s1 < s2
}

