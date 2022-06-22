import UIKit

var numberOfLegs = ["spider":8 , "ant":6, "cat":4]
numberOfLegs["bird"] = 2
numberOfLegs

//自訂一個subscript
struct TimesTable{
    let multiplier:Int
    subscript(index:Int) -> Int{
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[5]
