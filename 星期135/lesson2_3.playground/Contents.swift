import UIKit
//array
//建立一個空陣列
var someInts:[Int] = []
someInts.count

//增加值在最後面

someInts.append(3)
someInts
someInts.append(5)
someInts
someInts.append(7)
someInts

//透過[]符號給值
var someDouble = [1.0,2.0,3.0,4.0,5.0]
someDouble

var threeDoubles = Array(repeating: 0.0, count: 3)
threeDoubles

var shoppingList = ["Flour"]
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate", "Cheese", "Butter"]
shoppingList.count
shoppingList[0]
shoppingList[1]
shoppingList[2]
shoppingList[0...2]
shoppingList[...2]
shoppingList[2...]

//一個一個取出值
for item in shoppingList{
    print(item)
}

//取出值和索引編號
for (index, value) in shoppingList.enumerated(){
    print("\(index),\(value)")
}

for index in stride(from: 1, to: 4, by: 2){
    print(shoppingList[index])
}

//set,裏面放的內容不可以重覆

var intSet = Set<Int>()
intSet.insert(1)
intSet.insert(2)
intSet.insert(3)
intSet.insert(1)
intSet.insert(2)
intSet.insert(3)
intSet


//使用[]符號建立set
var favoriteGenres:Set = ["Rock", "Classical", "Hip hop"]
favoriteGenres

for value in favoriteGenres{
    print(value)
}

//2個set,交集,聯集,差集









