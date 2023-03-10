//instance method

class Counter{
    var count = 0
    
    func increment(){
        count += 1
    }
    
    func increment(by amount:Int){
        count += amount
    }
    
    func reset(){
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.count
counter.increment(by: 5)
counter.count
counter.reset()
counter.count

struct Point{
    var x=0.0, y=0.0
    func isToTheRightOf(x:Double)->Bool{
        return self.x > x
    }
}

struct Point1{
    var x=0.0, y=0.0
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
        x += deltaX
        y += deltaY
    }
}

struct Point2{
    var x=0.0, y=0.0
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
        self = Point2(x: x+deltaX, y: y+deltaY)
    }
}

enum TriStateSwitch{
    case off, low, high
    
    mutating func next(){
        switch(self){
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

//Type Method
class SomeClass{
    class func someTypeMethod(){
        
    }
}

SomeClass.someTypeMethod()
