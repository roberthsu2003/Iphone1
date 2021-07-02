struct TimesTable{
    let multiplier:Int
    subscript(index:Int) -> Int{
        return multiplier * index
    }
}

let threeTimesTables = TimesTable(multiplier: 3)
print("乘6的值是:\(threeTimesTables[6])")

var numberOfLegs = ["spider":8, "ant":6, "cat":4]
numberOfLegs["bird"] = 2
numberOfLegs
