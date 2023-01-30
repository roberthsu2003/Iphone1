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


let score = 70

if score >= 80{
    if score < 90{
        print("80~90")
    }
}

if score >= 80 && score < 90{
    print("80~90")
}

if score < 80 || score >= 90{
    print("0~79,90~100")
}

let score1 = 95

if score1 >= 90{
    print("優")
}else if score1 >= 80{
    print("甲")
}else if score1 >= 70{
    print("乙")
}else if score1 >= 60{
    print("丙")
}else{
    print("丁")
}

//switch 數值範圍

switch score1{
case 90...100:
    print("優")
case 80..<90:
    print("甲")
case 70..<80:
    print("乙")
case 60..<70:
    print("丙")
case 0..<60:
    print("丁")
default:
    print("不在範圍內")
}

let x=1
let y=0

if x==0 && y==0{
    print("(0,0)")
}else if x==0{
    print("在y軸上")
}else if y==0{
    print("在x軸上")
}else if (x <= 2) && (x >= -2) && (y <= 2) && (y >= -2){
    print("在2和負2之間")
}else{
    print("不在範圍內")
}

//switch tuple

let somePoint = (5,0)
switch somePoint{
case (0,0):
    print("(0,0)")
case (0,_):
    print("在y軸上")
case (_,0):
    print("在x軸上")
case (-2...2, -2...2):
    print("在2和負2之間")
default:
    print("不在範圍內")
}

