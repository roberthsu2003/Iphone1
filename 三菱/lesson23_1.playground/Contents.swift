protocol RandomNumberGenerator{
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()


class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

protocol TextRepresentable{
    var textualDescription:String {get}
}

extension Dice:TextRepresentable{
    var textualDescription:String{
        return "A \(sides) - sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
d12.textualDescription

let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

extension Array:TextRepresentable where Element:TextRepresentable {
    var textualDescription:String{
        return "abc"
    }
}

let myDice = [d12, d6]

myDice.textualDescription

struct Hamster{
    var name:String
    var textualDescription:String{
        return "A hamster named \(name)"
    }
}

extension Hamster:TextRepresentable{}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable:TextRepresentable = simonTheHamster
somethingTextRepresentable.textualDescription

struct Vector3D:Equatable{
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 4.0, z: 4.0)

let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)

twoThreeFour == anotherTwoThreeFour

enum SkillLevel:Comparable{
    case beginner
    case intermediate
    case expert(stars:Int)
}

var levels = [SkillLevel.intermediate, SkillLevel.beginner, SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]

for level in levels.sorted(){
    print(level)
}






