var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt:\(someInt), anotherInt:\(anotherInt)")


func swapTwoInts(_ a:inout Int, _ b:inout Int){
	let temporaryA = a
	a = b
	b = temporaryA
}

//function有型別
//型別(Int,Int)->Int
func addTwoInts(_ a:Int,_ b:Int) -> Int{
	return a + b
}

//型別(Int, Int) -> Int
func multiplyTwoInts(_ a:Int,_ b:Int) -> Int{
	return a * b
}
//變數儲存function
var mathFunction:(Int, Int) -> Int = addTwoInts

print("result:\(mathFunction(2, 3))")

mathFunction = multiplyTwoInts

print("result:\(mathFunction(2, 3))")

//function可以當作參數

func printMathResult(_ mathFunction:(Int, Int)->Int, _ a:Int,_ b:Int){
	print("resutl:\(mathFunction(a, b))")
}

printMathResult(addTwoInts,10,15)
