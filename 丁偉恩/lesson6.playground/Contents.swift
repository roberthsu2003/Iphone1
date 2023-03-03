struct FixedLengthRange{
    var firstValue:Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//lazy stored Property

class DataImporter{
    var filename = "data.txt"
}

class DataManager{
    lazy var importer = DataImporter()
    var data:[String] = []
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")
manager.importer.filename


struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    
    //computed property
    var center:Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

var initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)
square.origin


//Read-Only Computed Properties
struct Cuboid{
    var width = 0.0, height=0.0, depth = 0.0
    var volume:Double{
            return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)


class StepCounter{
    var totalSteps:Int = 0{
        willSet(newTotalSteps){
            print("傳進來的值是\(newTotalSteps)")
        }
        
        didSet{
            if totalSteps > oldValue{
                print("增加了\(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 100

stepCounter.totalSteps = 500



