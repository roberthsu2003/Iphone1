struct FixedLengthRange{
    var firstValue:Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 60

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


//computed property
struct Point{
    var x = 0.0, y = 0.0;
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
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
square.center

square.center = Point(x: 15.0, y: 15.0)

square

//read-only computed Property

struct Cuboid{
    var width=0.0, height=0.0, depth = 0.0
    var volumn:Double{
        return width * height * depth
    }
}

var fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
fourByFiveByTwo.volumn

//property observer
class StepCounter{
    var totalSteps:Int = 0{
        willSet(newTotalSteps){
            print("傳進來的值是\(newTotalSteps)")
        }
        didSet{
            //oldValue
            if totalSteps > oldValue{
                print("增加了\(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 100
stepCounter.totalSteps = 500

//type property
struct SomeStructure{
    static var storedTypeProperty = "String value"
    static var computedTypeProperty:Int{
        return 1
    }
}

SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty

enum SomeEnumeration{
    static var storedTypeProperty = "String value"
    static var computedTypeProperty:Int{
        return 6
    }
}

SomeEnumeration.storedTypeProperty
SomeEnumeration.computedTypeProperty


class SomeClass{
    static var storedTypeProperty = "String value"
    static var computedTypeProperty:Int{
        return 6
    }
    
    class var overrideableComputedTypeProperty:Int{
        return 107
    }
}

SomeClass.storedTypeProperty
SomeClass.computedTypeProperty
SomeClass.overrideableComputedTypeProperty



