import UIKit

let quotation  = """
諾羅拉警報！上周13.9萬人腹瀉就醫　近4周爆64起群聚

過年快到了，腹瀉疫情升溫中！疾病管制署今（16）日公布，國內上周因為腹瀉就診達到13.9萬人，且過去四周通報64起腹瀉群聚，都高於去年同期，群聚案件病原以諾羅病毒為主。疾管署提醒，民眾春節連假期間與親友圍爐聚餐時，務必留意手部衛生與飲食安全，如有腹瀉情形，待症狀解除至少48小時以後再恢復上班上學，以降低病毒傳播的風險。
"""

var empytString = ""
var anotherEmptyString = String()

var variableString = "Horse"

variableString = variableString + "and carriage"

var variableString1 = "Horse"
variableString1 += "and carriage"
variableString1


var name = "robert"
var myName = name;
myName = "Mr. Robert"
name
myName

let multiplier =  3

3 * 2.5

let message = "2.5的\(multiplier)倍是\(Double(multiplier) * 2.5)"
message

let 名字😙 = "robert"
名字😙

let greeting = "Guten Tag!"
greeting[greeting.startIndex]


let name1 = "Robert"
let name2 = "Robert"

name1 == name2

let nums:[Int] = [45, 92, 31]
nums



let nums1:[Int] = [78, 92, 75, 83] //明確宣告
nums1

let nums2 = [78, 92, 75, 83] // 不明確宣告
nums2

var someInt:[Int] = [] //建立空的陣列,一定要明確宣告資料類型
someInt.count
someInt.append(3)
someInt.append(5)
someInt.append(7)

//var threeDoubls = [0.0, 0.0, 0.0]
var tenDoubles = Array(repeating: 0.0, count: 10)
tenDoubles

//陣列可以使用 + 運算子

var anotherThreeDoubles  = Array(repeating: 2.5, count: 3)

tenDoubles + anotherThreeDoubles

var shoppingList:[String] =  ["Eggs", "Milk"]
var shoppingList1 =  ["Eggs", "Milk"]


shoppingList1.count

if shoppingList1.isEmpty{
    print("shoppingList是空的")
}else{
    print("shoppingList有\(shoppingList1.count)")
}
//加在後面
shoppingList1.append("Flour")

shoppingList1 += ["Baking Powder"]

shoppingList1 += ["Chocolate Spread", "Chees", "Butter"]

//取出值
shoppingList1[0]
shoppingList1[0] = "Six eggs"
shoppingList1

shoppingList1.count
shoppingList1[3...6]
shoppingList1[3..<6]

//插入元素
shoppingList1.insert("Maple Syrup", at: 0)
shoppingList1

//移除元素
shoppingList1.remove(at: 0)
shoppingList1







