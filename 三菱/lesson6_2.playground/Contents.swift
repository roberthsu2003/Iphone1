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

//function 可以當作引數值
//function參數可以定義function type

func printMathResult(_ mathFunction:(Int,Int)->Int,_ a:Int,_ b:Int){
    print("處理完的結果是:\(mathFunction(a,b))")
}

printMathResult(addTwoInts, 10, 5)
printMathResult(multiplyTwoInts, 10, 5)





