//collection Type
//明確宣告Array
//建立空的array
var someInts:[Int] = []
//var someInts:Array<Int> = []

print("someInts的元素數量\(someInts.count)")

//append()實體方法
someInts.append(3)

//全部清空
someInts = []

//建立Array,同時有預設的元素值
var threeDoubles = Array(repeating: 0.0, count: 3)
threeDoubles

var anotherThreeDouble = Array(repeating: 2.5, count: 3)
anotherThreeDouble

var sixDouble = threeDoubles + anotherThreeDouble
sixDouble

//var shoppingList:[String] = ["Eggs", "Milk"]
var shoppingList = ["Eggs", "Milk"]

shoppingList.count
shoppingList.isEmpty
shoppingList.append("Flour")

shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
//透過索引編號取出值
shoppingList[0]
//透過索引編號更新值
shoppingList[0] = "Six eggs"
//使用Range取出值
shoppingList[4...6]
//使用Range改變值

shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList
