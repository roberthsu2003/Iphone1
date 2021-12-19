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

let colorNameToUse = userDefinedColorName ?? defaultColorName //取出裏面的值

colorNameToUse

//optional binding
var colorNameToUse2:String

if let colorNameToUse1 = userDefinedColorName{
    //保證userDefinedColorName不是nil
    colorNameToUse2 = colorNameToUse1
}else{
    //保證userDefinedColorName是nil
   colorNameToUse2 = defaultColorName
}

//範圍運算子
//...
//..<
1...5
1..<5

for i in 1...5{
    print(i)
}

for j in 1..<5{
    print(j)
}

let names = ["Anna", "Alex", "Brian", "Jack"] //array

for name in names{
    print(name)
}


let someString = "some string literal value"

let quotation = """
美國NBC新聞報導，美國華盛頓大學和瑞士藥商Humabs BiomedSA在18日發表一項尚待同行評

議研究指出，僅完整接種疫苗不追加施打加強針

的狀況下，嬌生（Johnson & Johnson）、中國國藥疫苗和和俄國史普尼克V（Sputnik V）疫苗幾乎無效。


"""

print(quotation)

let numberString1 = "1234"
let numberString2 = "5678"
numberString1 + numberString2

print("2個數值字串的內容:" + numberString1 + numberString2)
print("2個數值字串的內容:\(numberString1)\(numberString2)")

for num in numberString1{
    print(num)
}
