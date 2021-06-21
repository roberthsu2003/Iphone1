//function功能
//類別內，叫方法，method

//定義功能
func greet(p person:String) -> String{
    let greeting = "Hello," + person + "!"
    return greeting
}

print(greet(p: "Anna"))
print(greet(p: "Brian"))

//定義功能
func greet(_ person:String) -> String{
    let greeting = "Hello Welcome," + person + "!"
    return greeting
}

print(greet("Anna"))
print(greet("Brian"))
