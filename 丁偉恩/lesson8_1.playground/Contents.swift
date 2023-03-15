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
