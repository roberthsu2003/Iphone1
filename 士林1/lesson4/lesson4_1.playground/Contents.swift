import UIKit

struct FixedLengthRange{
    var firstValue: Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 10
//rangeOfThreeItems.length = 20

let rangeOfFourItems = rangeOfThreeItems
//rangeOfFourItems.firstValue = 20

//lazy stored Properties

class DataImporter{
     var filename = "data.txt"
}

class DataManager{
    lazy var importer = DataImporter()
    var data:[String] = []
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
manager.importer.filename

//computed property 計算
struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    var center:Point{ //computed property
        get{ //被別人取出,要有return
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x:centerX, y:centerY)
        }
        
        set(newCenter){ //要有參數
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
    }
    
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center

square.center = Point(x: 10.0, y: 10.0)
print("square.origin.x \(square.origin.x)")
print("square.origin.y \(square.origin.y)")







