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

