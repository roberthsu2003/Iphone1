//建立空陣列
var someInts = [Int]()
someInts

print("someInts內的元素數量為:\(someInts.count)")

//加入元素至最後面
someInts.append(3)
someInts.append(6)
someInts = []

//建立有預設值的陣列
var threeDouble = Array(repeating: 0.0, count: 10)
threeDouble

//陣列+陣列(組合陣列)

var anotherThreeDouble = Array(repeating: 2.5, count: 10)

var sixDouble = threeDouble + anotherThreeDouble
sixDouble

//可以使用純值的表示法，建立陣列
//[value1, value2, value3]
var shoppingList = ["Eggs", "Milk"]

//操控陣列
shoppingList.count
shoppingList.isEmpty
shoppingList.append("Flour")

shoppingList[0]
shoppingList[1]
shoppingList[2]

shoppingList[0] = "Egg"
shoppingList[1...2]
shoppingList.insert("Syrup", at: 0)
shoppingList.remove(at: 0)
shoppingList

//讀取每一個元素
for item in shoppingList{
    print(item)
}
//讀取每一個元素和索引
for (index,item) in shoppingList.enumerated(){
    print("元素\(index):\(item)")
}








