//運算子
//指定運算子 =

let b = 10
var a = 5
a = b
print("a=\(a)")

//數學運算子
// +,-,*,/,%

1 + 2
5 - 3
2 * 3
10.0 / 2

"hello, " + "world"

9 % 4

//複合指定運算子

var a1 = 5
a1 + 1
print(a1)

var a2 = 5
a2 = a2 + 1
print(a2)

var a3 = 5
a3 += 1
print(a3)

var a4 = 5
a4 *= 2
print(a4)

//比較運算子
//得到Bool
// ==,!=,>,<,>=, <=

1 == 1
2 != 1
3 > 5

let name = "world"
if name == "world"{
   print("Hello! World!")
}

//3元運算子
/*
let contentHeight = 40
let hasHeader = false
var rowHeight = 0
if hasHeader{
    rowHeight = contentHeight + 50
}else{
    rowHeight = contentHeight + 20
}

print(rowHeight)
 */

let contentHeight = 40
let hasHeader = false
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight)

//nil運算子 ??

var userDefinedColrName:String? = "green"
var colorNameToUse = userDefinedColrName ?? "red"
colorNameToUse

//範圍運算子
for index in 1...5{
    print(index)
}

for index in 1..<5{
    print(index)
}
