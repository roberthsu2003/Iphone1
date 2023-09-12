struct TimesTable{
    let multiplier:Int
    
    subscript(index:Int) -> Int{
            return index * multiplier
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[6]

//內建的subscript
var numberOfLegs = ["spider":8, "ant":6, "cat":4]
numberOfLegs["bird"] = 2
numberOfLegs

//自已訂義2個參數

struct Matrix{
    let rows:Int, columns:Int
    var grid:[Double]
    init(rows:Int, columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row:Int, column:Int) -> Bool{
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row:Int, column:Int) -> Double{
        get{
            assert(indexIsValid(row:row,column: column), "超出範圍")
            return grid[(row * columns)+column]
        }
        set{
            assert(indexIsValid(row:row,column: column), "超出範圍")
           grid[(row * columns)+column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[1,0] = 10.0 //set
matrix[1,0] //get
//matrix[2,1]

//type subscript

enum Planet:Int{
    case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n:Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
mars.rawValue
