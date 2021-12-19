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

//Array陣列的屬性count
print("shoppingList內的陣列元素有\(shoppingList.count)個")

//Array陣列的屬性isEmpty
print(shoppingList.isEmpty ? "空的" : "不是空的")

//做用append()方法,增加元素
shoppingList.append("Flour")
shoppingList

//使用+運算子增加元素
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

//取出元素內容
shoppingList[0]

//更改元素內容
shoppingList[0] = "Six eggs"

//元素insert(),插入
shoppingList.insert("Maple Syrup" , at: 0)

//移除元素,remove()
shoppingList.remove(at: 0)
shoppingList

for item in shoppingList{
    print(item)
}

//使用enumerated()
//傳出tuple
for (index, item) in shoppingList.enumerated(){
    print("\(index)-\(item)")
}

//使用Set<Chracter>()
var letters = Set<Character>()
letters

//cout,元素數量
letters.count

//做用insert新增元素
letters.insert("a")
letters

letters.insert("a")
letters

letters = []

//使用[]建立set
var favoriteGenres:Set = ["Rock", "Classical", "Hip hop"]
favoriteGenres

for item in favoriteGenres{
    print(item)
}

favoriteGenres.contains("Rock1") ?"有" : "沒有"

//使用Dictionary資料類型建立[Int:String]()

var namesOfIntegers = [Int:String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers

//使用純值建立Dictionary
var airports = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]
airports

//count
airports.count

airports["LHR"] = "London"
airports

airports["LHR"] = "London Heathrow"
airports

//Dictionary透過key,取出的值是optional type
var value = airports["LHR"]

//透過updateValue()更新值
//optional binding來檢查是否更新成功
if let oldValue = airports.updateValue("Dublic Airport", forKey: "DUB"){
    print("更新成功,原本的值是\(oldValue)")
}else{
    print("更新值失敗")
}


if let value1 = airports["LHR"]{
    print("取出成功\(value1)")
}else{
    print("沒有LHR")
}

print(airports["LHR1"] ?? "沒有LHR1 Key")

for (key,value) in airports{
    print("\(key)-\(value)")
}





