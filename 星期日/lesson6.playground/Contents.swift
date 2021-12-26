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


