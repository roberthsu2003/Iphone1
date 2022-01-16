//實體method可以直接存取實體的property
//存取實體的property(self.property)
class Counter{
    //實體property
    var count = 0
    
    //實體method
    func increment(){
        self.count += 1
    }
    
    func increment(by amount:Int){
        self.count += amount
    }
    
    func reset(){
        self.count = 0;
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

struct Point{
    var x=0.0, y=0.0;
    func isToTheRighOf(x:Double) -> Bool{
        return self.x > x;
    }
    
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
somePoint.x
somePoint.y

struct Point1{
    var x=0.0, y=0.0;
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
       self = Point1(x:x + deltaY, y: y + deltaY)
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

var ovenLight = TriStateSwitch.off
ovenLight.next()
ovenLight.next()
ovenLight.next()

//Type Method
class SomeClass{
    static var count = 0
    class func someTypeMethod(){
        //type的method,只可以存取Type Property,不可以實體的property
        count += 1
    }
}

SomeClass.someTypeMethod()



