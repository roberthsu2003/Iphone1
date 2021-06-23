func addTwoInts(_ a:Int,_ b:Int) -> Int{
    return a + b;
}


func multiplyTwoInts(_ a:Int, _ b:Int) -> Int{
    return a * b
}


var mathFunction:(Int,Int)->Int = addTwoInts

mathFunction(20, 30)
mathFunction = multiplyTwoInts
mathFunction(20, 30)
