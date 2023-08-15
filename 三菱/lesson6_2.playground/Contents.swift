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

/*-------------------------------------*/
//function 可以當作引數值
//function參數可以定義function type

func printMathResult(_ mathFunction:(Int,Int)->Int,_ a:Int,_ b:Int){
    print("處理完的結果是:\(mathFunction(a,b))")
}

printMathResult(addTwoInts, 10, 5)
printMathResult(multiplyTwoInts, 10, 5)


/*-------------------------------------*/
/*
//function type可以被return
func stepForward(_ input:Int) -> Int{
    return input + 1
}

func stepBackward(_ input:Int) -> Int{
    return input - 1
}

func chooseStepFunction(backward:Bool) -> (Int)->Int{
    return backward ? stepBackward : stepForward
}

var currentValue = -5

let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
//moveNearerToZero(currentValue)

print("zeor")
*/


/*------------------------------*/
//巢狀的function

func chooseStepFunction(backward:Bool) -> (Int)->Int{
    func stepForward(_ input:Int) -> Int{
        return input + 1
    }
    func stepBackward(_ input:Int) -> Int{
        return input - 1
    }
    return backward ? stepBackward : stepForward
}

var currentValue = 3

let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0{
    print("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}


print("zeor")







