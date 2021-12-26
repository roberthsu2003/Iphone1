let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names{
    print("Hello,\(name)")
}

let numberOfLegs = ["spider":8, "ant":6, "cat":4]

for (animalName, legCount) in numberOfLegs{
    print("\(animalName)有\(legCount)腳")
}

for index in 1...5{
    print("\(index)*5=\(index*5)")
}


let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= 3
}
print("\(base)的\(power)次方是\(answer)")

//while,不知道要執行幾次
var times = 0;
while(times<5){
    print(times)
    times += 1
}

var temperatureInFahrenheit = 50

//單向選擇
if temperatureInFahrenheit <= 32 {
    print("現在非常冷")
}

//雙向選擇
if temperatureInFahrenheit <= 32{
    print("現在非常冷")
}else{
    print("現在不是非常冷")
}

let money = 82_450.0

var paymoney = 0;

if(money >= 100000){
    paymoney = Int(money * 0.8)
}else if(money >= 50000){
    paymoney = Int(money * 0.85)
}else if(money >= 30000){
    paymoney = Int(money * 0.9)
}else if(money >= 10000){
    paymoney = Int(money * 0.95)
}else{
    paymoney = Int(money)
}

print("你消費了\(money),打折後的價格是\(paymoney)")


let someCharacter:Character = "a"

switch someCharacter{
case "a":
    print("是a")
case "b":
    print("是b")
default:
    print("不是a和b")
}

let approximateCount = 3200
switch approximateCount{
case 0:
    print("這是0")
case 1..<5:
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


