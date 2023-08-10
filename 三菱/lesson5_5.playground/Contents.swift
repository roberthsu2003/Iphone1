func greet(person:String) -> String{
    let greeting = "Hello!, " + person
    return greeting
}
print(greet(person: "robert"))
print(greet(person: "Brian"))

func greetAgain(person:String) -> String{
    return "Hello agian, " + person + "!"
}

greetAgain(person: "Anna")

//沒有參數
func sayHelloWorld() -> String{
    return "Hello! World!"
}

sayHelloWorld()

//多個參數
//overloading
func greet(person:String, alreadyGreeted:Bool) -> String{
    if alreadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

greet(person: "Tim", alreadyGreeted: true)
