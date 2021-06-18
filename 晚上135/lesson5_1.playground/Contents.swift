let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names{
    print("Hello, \(name)")
}

let numberOfLegs = ["spider":8, "ant":6, "cat":4]
for (animalName, legCount) in numberOfLegs{
        print("\(animalName)有\(legCount)腿")
}

for index in 1...5{
    print(index)
}

for tickMark in stride(from: 0, to: 60, by: 5){
    print(tickMark)
}

for tickMark in stride(from: 0, through: 60, by: 5){
    print(tickMark)
}
/*
var index = 0
while (index < names.count){
    print(names[index])
    index += 1
}
 */

var index:Int? = nil

repeat{
    if index == nil{
        index = 0
    }
    print(names[index!])
    index! += 1
    
}while(index! < names.count)

