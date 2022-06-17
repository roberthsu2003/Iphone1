import UIKit

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names{
    print("Hello! \(name)")
}

let numberOfLegs = ["spider":8, "ant":6, "cat":4]
for (animalName, legCount) in numberOfLegs{
    print("\(animalName),\(legCount)")
}

for index in 1...5{
    print(index)
}

for index in 1..<5{
    print(index)
}

//省略運算子
for _ in 1..<5{
    print("Hello")
}

let minutes = 60
for tickMark in 0..<minutes{
    print(tickMark)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval){
    print(tickMark)
}

for tickMark in stride(from: 0, through: minutes, by: minuteInterval){
    print(tickMark)
}

var total = 0

while(total < 1000){
    total += Int.random(in: 100...150)
}
print(total)

repeat{
    total -= Int.random(in: 100...200)
}while(total>0)
print(total)

var temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32{
    print("非常冷")
}else{
    print("不太冷")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32{
    print("非常冷")
}else if temperatureInFahrenheit >= 86{
    print("非常熱")
}else{
    print("不冷不熱")
}

//switch
let someCharacter:Character = "y"
switch someCharacter{
case "a":
    print("a")
case "z","y":
    print("z or y")
default:
    print("除a和z,y以外的")
}

//switch 整合範圍運算

let approximateCount = 110

switch(approximateCount){
case 0:
    print("0")
case 1..<4:
    print("1~4")
case 5..<12:
    print("5~11")
case 12..<100:
    print("12~99")
case 100..<1000:
    print("100~999")
default:
    print("1000以上")
}


