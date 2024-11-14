import UIKit

//Function types
//如何表示function type

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

//(Int,Int)->Int

//function參考至變數
var abc = addTwoInts
abc = multiplyTwoInts

//function當作引數值

func printMathResult(_ mathFunction:(Int,Int)->Int,_ a:Int, _ b:Int){
    
}

//function當作傳出值

func stepForward(_ input:Int) -> Int{
    return input + 1
}

func stepBackward(_ input:Int) -> Int{
    return input - 1
}

func chooseStepFunction(backward:Bool) -> (Int) -> Int{
    if backward {
        return stepBackward
    } else {
        return stepForward
    }
        
}

chooseStepFunction(backward: true)

//function內可以定義function


//Closure






