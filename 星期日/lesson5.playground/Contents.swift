//使用陣列資料類型建立空陣列
var someInts = [Int]()
someInts
someInts.append(3)
someInts.append(5)
someInts.append(7)
someInts


//建立陣列,有預設值,使用Array初始化
var threeDoubles = Array(repeating: 0.0, count: 3)
threeDoubles

var anotherThreeDouble = Array(repeating: 2.5, count: 3)

//陣列是可以使用加法運算
threeDoubles + anotherThreeDouble

//直接使用[]建立陣列
var shoppingList = ["Eggs", "Milk"]
shoppingList

