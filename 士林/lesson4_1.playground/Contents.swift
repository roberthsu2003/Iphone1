let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names{
    print("Hello! \(name)!")
}

let numberOfLegs = ["spider":8,"ant":6,"cat":4]
for (animalName, legCount) in numberOfLegs{
    print("\(animalName)有\(legCount)隻腳!")
}

for index in 1...5{
    print("索引是\(index), *5的值是\(index*5)")
}

let base = 5;
let power = 10;
var answer = 1
for _ in 1...power{
    answer *= base;
}
print("\(base)的10次方是\(answer)")

let minutes = 60
for tickMark in 0..<minutes{
    print(tickMark)
}

for tickMark in stride(from: 0, to: minutes, by: 5){
    print(tickMark)
}

for tickMark in stride(from: 0, through: minutes, by: 5){
    print(tickMark)
}
