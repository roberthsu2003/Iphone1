let b = 10
var a = 5
a = b
a
b
let (x, y) = (1, 2)
x
y
1 + 2
5-3
2*3
10.0 / 2.5

"hello," + "world"

9 % 4

4 * 2 + 1

-3

var a1 = 2
a1 = a1 + 5

//複合指定運算子
a1 += 5

//比較運算子
3 == 3
3 > 3
3 >= 3

//3元運算式
let contentHeight = 40
let hasHeader = false
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//nil運算子
let numberString = "123a"
let convertNumber = Int(numberString) ?? 0
convertNumber

//範圍運算子

for index in 1...5{
    print(index)
}


for index in 101..<105{
    print(index)
}

//多行文字
let news = """
本土新冠疫情尚未趨緩，今（11日）國內新增了286例本
土案例、24例死亡個案，三級警戒至6月28日，確診人數也破萬人。
對此，精神專科醫師蘇偉碩在臉書指出，
台灣疫情會這麼嚴重是因為「雙盲」。
"""

print(news)



