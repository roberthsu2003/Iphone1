var  temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32{
    print("非常冷")
}

var  temperatureInFahrenheit1 = 40

if temperatureInFahrenheit1 <= 32{
    print("非常冷")
}else{
    print("不會非常冷")
}

var  temperatureInFahrenheit2 = 70

if temperatureInFahrenheit2 <= 32{
    print("非常冷")
}else if temperatureInFahrenheit2 >= 86{
    print("非常熱")
}else{
    print("溫暖")
}


let someCharacter:Character = "c"

switch someCharacter{
case "a":
    print("這是字元a")
case "z":
    print("這是字元z")
default:
    print("這不是字元a或z")
}

