//範圍運算子

for index in 1...5{
	print(index)
}

for index in 1..<5{
	print(index)
}
print("===========")
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names{
	print(name)
}
print("===========")

for name in names[2...]{
	print(name)
}
print("===========")

for name in names[...2]{
	print(name)
}

print("============")

//集合型別

//建立空的陣列
var someInts:[Int] = []
someInts.append(3)
print(someInts)
someInts = []
print(someInts)

print("============")

var threeDouble = Array(repeating:0.0, count:3)
print(threeDouble)

var anotherThreeDoubles = Array(repeating:2.5, count:3)
var sixDouble = threeDouble + anotherThreeDoubles
print(sixDouble)

print("==========")

var shoppingList:Array<String> = ["Eggs", "Milk"]
print(shoppingList)

print("==========")

//Set
var favoriteInts:Set = [1, 1, 2, 2, 3, 3]
print(favoriteInts)

//Set交集,聯集,差集
let oddDigits:Set = [1, 3, 5, 7, 9]
let evenDigits:Set = [0, 2, 4, 6, 8]
let singleDigitprimeNumbers:Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits).sorted())

print("=========")
//Dictionary
var namesOfIntegers:[Int:String] = [:]
print(namesOfIntegers)

print("=========")

namesOfIntegers[16] = "sixteen"

print(namesOfIntegers)

print("========")

var airports:[String:String] = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]

print(airports)
print("==========")

for (airportCode,airportName) in airports{
	print("\(airportCode),\(airportName)")
}
