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
func minMax() -> (min:Int,max:Int){
    return (3,50)
}

let bounds = minMax()
bounds.min
bounds.max
