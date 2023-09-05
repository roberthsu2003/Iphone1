class Counter{
    var count = 0
    //定義3個實體方法
    func increment(){
        self.count += 1
    }
    
    func increment(by amount:Int){
        self.count += amount
    }
    
    func reset(){
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 6)
counter.reset()

//有一個狀況一定要用self,當參數名稱和property是相同名稱時

struct Point{
    var x = 0.0, y = 0.0
    func isToTheRightOf(x:Double) -> Bool{
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0){
    print("實體的x,大於參數1.0")
}

struct Point1{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX:Double, y deltay:Double){
        x += deltaX
        y += deltay
    }
}

var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 2.0, y: 3.0)
somePoint1.x
somePoint1.y

let fixedPoint1 = Point1(x: 3.0, y: 3.0)
//fixedPoint1.moveBy(x: 2.0, y: 3.0)

var somePoint2 = Point1(x: 1.0, y: 1.0)
somePoint2 = Point1(x: 3.0, y: 3.0)

struct Point2{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
        self = Point2(x: x+deltaX, y: y+deltaY)
    }
}

enum TriStateSwitch{
    case off, low, high
    
    mutating func next(){
        switch self{
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()
ovenLight.next()

