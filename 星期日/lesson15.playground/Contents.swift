//instance Subscirpt
struct TimerTable{
    let multiplier:Int
    subscript(index:Int) -> Int{
        return index * multiplier;
    }
}

let threeTimesTable = TimerTable(multiplier: 3)
threeTimesTable[5]

var numberOfLegs = ["spider":8, "ant":6, "cat":4]
numberOfLegs["spider"]
numberOfLegs["bird"] = 2

numberOfLegs

//type Subscript

enum Planet:Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, netune
    
    static subscript(n:Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

Planet[4]




