//comparison operator(比較運算子)
1 == 1.0
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "World"
if name == "world"{
    print("Hello, world")
}else{
    print("不相等")
}

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")

/*
let contentHeight = 40
let hasHeader = true
let rowHeight:Int
if hasHeader{
     rowHeight = contentHeight + 50
}else{
     rowHeight = contentHeight + 20
}*/

//三元運算式(? :)
let contentHeight = 40
let hasHeader = false
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
rowHeight

let defaultColorName = "red"
var userDefinedColorName:String?

//nil運算子
var colorNameToUse = userDefinedColorName ?? defaultColorName
colorNameToUse

//range operator(範圍運算子)
for index in 1...5{
    print(index)
}

for index in 1..<5{
    print(index)
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count

for i in 0..<count{
    print(names[i])
}

