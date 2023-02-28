struct FixedLengthRange{
    //store property
    var firstValue:Int
    let  length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue =  6
//rangeOfThreeItems.length = 95
rangeOfThreeItems.length


class DataImporter{
    //建立實體需要10秒鐘
    var filename = "data.txt"
}

class DataManager{
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
manager.importer.filename


struct Point{
    var x=0.0, y=0.0;
}

struct Size{
    var width=0.0, height=0.0
}

struct Rect{
    //store property
    var origin = Point()
    var size  =  Size()
    //computed property
    var center:Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x:centerX,y:centerY)
        }
        
        set{
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
    
}

var square = Rect(origin:Point(x:0.0,y:0.0),
                  size:Size(width:10.0,height: 10.0))

square.center
square.center = Point(x:15.0, y:15.0)
square.center

struct Cuboid{
    var width=0.0, height=0.0, depth=0.0
    var volumn:Double{
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
fourByFiveByTwo.volumn
//fourByFiveByTwo.volumn = 50

class StepCounter{
    var totalStep:Int = 0{
        willSet(newTotalSteps){
            print("新傳進來的值是\(newTotalSteps)")
        }
        
        didSet{
            if totalStep > oldValue{
                print("增加\(totalStep-oldValue)數值")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalStep = 200
stepCounter.totalStep = 360
stepCounter.totalStep = 100
stepCounter.totalStep = 896



