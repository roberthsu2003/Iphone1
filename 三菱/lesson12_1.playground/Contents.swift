struct TimesTable{
    let multiplier:Int
    
    subscript(index:Int) -> Int{
            return index * multiplier
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[6]
