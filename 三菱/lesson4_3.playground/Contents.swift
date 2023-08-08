//明確知道執行迴圈次數

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names{
    print("Hello, \(name)")
}

let numberOfLegs = ["spider":8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs{
    print("\(animalName):\(legCount)")
}

for index in 1...5{
    print(index)
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= base
}

print("\(base)的\(power)次方是\(answer)")

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
        
