var numberOfLegs = ["spider": 8, "ant": 6, "cat":4]
numberOfLegs["spider"]
numberOfLegs["bird"] = 2

struct TimesTable{
    let multiplier:Int
    subscript(index:Int) -> Int{
        return multiplier * index
    }
    
}

let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[5]


enum Planet:Int{
    case mercury=1,venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n:Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

let planet = Planet[4]
planet
