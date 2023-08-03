//substrings

let greeting = "Hello! world!"
/*
 #optional binding
if let index = greeting.firstIndex(of: ","){
    greeting[..<index]
}else{
    print("沒有,號")
}
 */
/*
 #沒有檢查
let index = greeting.firstIndex(of: ",")
greeting[..<index!]
 */

//使用nil運算子
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
let newString = String(beginning)

let quotation = "abc"
let quotation1 = "abC"

if quotation == quotation1{
    print("相同")
}else{
    print("不相同")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet{
    if scene.hasPrefix("Act 1"){
        act1SceneCount += 1
    }
}
print("Act 1有的數量是\(act1SceneCount)")

var mansionCount = 0
var cellCount = 0

for scene in romeoAndJuliet{
    if scene.hasSuffix("Capulet's mansion"){
        mansionCount += 1
    }else if scene.hasSuffix("Friar Lawrence's cell"){
        cellCount += 1
    }
}

print("mansionCount=\(mansionCount)")
print("cellCount=\(cellCount)")








