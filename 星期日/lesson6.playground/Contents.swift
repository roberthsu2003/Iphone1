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

