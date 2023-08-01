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


