import UIKit

var numberOfLegs = ["spider":8 , "ant":6, "cat":4]
numberOfLegs["bird"] = 2
numberOfLegs

//自訂一個實體的subscript
struct TimesTable{
    let multiplier:Int
    subscript(index:Int) -> Int{
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[5]

//type subscript
enum Planet:Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    static subscript(n:Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
mars.rawValue
