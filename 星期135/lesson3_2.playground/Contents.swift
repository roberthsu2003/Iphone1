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

