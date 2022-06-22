import UIKit

//store property
struct FixedLengthRange{
    var firstValue:Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue
rangeOfThreeItems.length
rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6

//lazy store property
class DataImporter{
    var filename = "data.txt"
}

class DataManager{
    lazy var importer = DataImporter()
    var data:[String] = []
}

let manager = DataManager()
manager.data.append("Some Data")
manager.data.append("some More Data")
print(manager.importer.filename)

//computed property
struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width=0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    //computed Property
    //get,set
    //get
    //computed Property明確宣告資料類型
    var center:Point{
        get{
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))
square.center

square.center = Point(x: 15.0, y: 15.0)

square.center

