//Function type

func addTwoInts(_ a:Int,_ b:Int) -> Int{
    return a + b
}

func multiplyTwoInts(_ a:Int,_ b:Int) -> Int{
    return a * b
}
//function 可以指定給變數
var mathFunction:(Int,Int)->Int = addTwoInts

mathFunction(2,3)


mathFunction = multiplyTwoInts

mathFunction(2, 3)


