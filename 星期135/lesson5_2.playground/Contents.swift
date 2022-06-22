import UIKit

class Counter{
    var count = 0
    
    //實體的method
    func increment(){
        self.count += 1
    }
    //實體的method
    func increment(by amount:Int){
        self.count += amount
    }
    //實體的method
    func reset(){
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.count
counter.increment(by: 5)
counter.count
counter.reset()
counter.count

//mutating method
//只可以使用在結構
//如果method會改變結構內store property的值,必需使用mutating method
struct Point{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
somePoint.x
somePoint.y

//列舉也可以有method()
//value type 可以使用self=xxxx
struct Point1{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
       self = Point1(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 2.0, y: 3.0)
somePoint1.x
somePoint1.y

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

var overLight = TriStateSwitch.off
overLight.next()
overLight.next()
overLight.next()


//Type Methods
class SomeClass{
    static func someTypeMethod(){
        
    }
    class func someTypeClassMethod(){
        
    }
}
SomeClass.someTypeMethod()
SomeClass.someTypeClassMethod()

