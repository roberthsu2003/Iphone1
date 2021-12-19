//tuple拆解,使用=指定運算子
let (x,y) = (1,2)
x
y

//數學運算子
// +,-,*,/,%
//相同資料類型才可以運算
1 + 2
5 - 3
2 * 3
10.5 / 2.5

20 % 3

//複合指定運算子
// +=, -=, *=, /=, %=

var a = 10
a = a + 20

var b = 10
b += 20

//比較運算子
// ==, >=, <=, !=, >, <
//比較運算子會傳出Bool

1 == 1
1 != 1
2 > 1

//3元運算子,簡單的判斷
let contentHeight = 40
let hasHeader = false
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
rowHeight



//nil運算子

let defaultColorName = "red"

var userDefinedColorName:String?

let colorNameToUse = userDefinedColorName ?? defaultColorName

colorNameToUse
