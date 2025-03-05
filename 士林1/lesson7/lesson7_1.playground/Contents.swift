import UIKit

//type method
class SomeClass{
    class func someMethod(){
        print("class method")
    }
}

SomeClass.someMethod()

//subscript
var numberOfLegs = ["spider":8, "ant":6, "human":2, "dog":4, "cat":4]
numberOfLegs["spider"]

struct Matrix{
    let rows: Int
    let columns: Int
    var grid: [Double]
    
    //自訂的initializer
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }
    
    func indexIsValid(_ row: Int, _ column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript (row: Int, column: Int) -> Double {
        get{
            assert(indexIsValid(row, column), "Index out of bounds")
            return Double(grid[row * columns + column])
        }
        
        set{
            assert(indexIsValid(row, column), "Index out of bounds")
            grid[row * columns + column] = newValue
        }
    }

}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

print(matrix[0, 1])
print(matrix[1, 0])

enum Planet:Int{
    case mercury = 1
    case venus
    case earth
    case mars
    case jupiter
    
    static subscript(n:Int) -> Planet?{
        return Planet(rawValue: n)
    }
}

if let mars = Planet[100]{
    print(mars)
}else{
    print("超過了範圍")
}




