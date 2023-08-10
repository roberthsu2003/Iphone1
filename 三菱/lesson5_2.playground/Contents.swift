//轉換程式流程方向
//continue
//break
//fallthrough
//return
//throw

//continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""

let charactersToRemove:[Character] = ["a","e","i","o","u"," "]

for character in puzzleInput{
    if charactersToRemove.contains(character){
        continue
    }
    puzzleOutput.append(character)
}

print(puzzleOutput)

let numberSymbol: Character = "๓"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?

switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue{
    print("符號:\(numberSymbol)代表\(integerValue)")
}else{
    print("符號:\(numberSymbol)代表不明")
}

//fallthrough,使用在switch內

let integerToDescribe = 5
var description = "這數值是\(integerToDescribe),"

switch integerToDescribe{
case 2, 3, 5, 7, 11,13, 17, 19:
    description += "也是質數"
    fallthrough
default:
    description += "。"
}
print(description)

