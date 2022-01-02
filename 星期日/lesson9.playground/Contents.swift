func greet(person:String) -> String{
    let greeting = "Hello," + person + "!"
    return greeting
}

greet(person: "Anna")

//沒有參數的function
func sayHelloWorld() -> String{
    return "Hello, World"
}

sayHelloWorld()

//多個參數名稱的function
func greetAgain(person:String) -> String{
    return "Hello again," + person + "!"
}

greetAgain(person: "Anna")

func greet(person:String, alreadyGreeted:Bool) -> String{
    if alreadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

greet(person: "Time", alreadyGreeted: true)

//沒有return的function
func greet(p:String){
    print("Hello, \(p)")
}

greet(p: "Anna")

//function 可以傳出多個值(利用tuple)
/*
func minMax() -> (min:Int,max:Int){
    return (3,50)
}

let bounds = minMax()
bounds.min
bounds.max
 */

//function也可檢查錯誤
func minMax(num:Int) -> (min:Int, max:Int)?{
    if num == 10{
        return nil
    }
    return (3,50)
}

//使用if來檢查是不是nil
if minMax(num: 10) == nil {
    print("傳出的是nil")
}

//optional binding
if let bounds = minMax(num: 10){
    print(bounds.min)
    print(bounds.max)
}else{
    print("傳出的是nil")
}

//nil 運算子
let bounds = minMax(num: 10) ?? (10,10)
print(bounds.min)
print(bounds.max)

//提早離開
func simpleFun(){
    guard let bounds = minMax(num: 10) else{
        print("內容是nil")
        return
    }
    
    print(bounds.max)
    print(bounds.min)
    
}

simpleFun()

