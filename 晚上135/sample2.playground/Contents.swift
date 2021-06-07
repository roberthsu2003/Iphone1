let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble:Double = 70

let myInt = 14
let myDouble = 14.0
let myFloat:Float = 14
let myString = "這是字串"
let myBool = true

//只有相同型別可以運算
//不同的數值型別會自動轉型為比較精準的型別
let apples = 3 + 0.5
let oranges = 5 + 3.0

let label = "The width is "
let width = 94

//手動轉換型別
let widthLabel = label + String(width)
print(widthLabel)

let apple = 3
let orange = 5
let appleSummary = "我有" + String(apple) + "個蘋果"

//字串插補
let appleSummary1 = "我有\(apple)個蘋果,同時我有\(orange)橘子"







