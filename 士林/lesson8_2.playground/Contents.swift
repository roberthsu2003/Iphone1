//實體的method

class Counter{
    var count = 0
    
    func increment(){
        self.count += 1
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
counter.increment(by: 5)
counter.reset()

//實體的method
struct Point{
    var x = 0.0, y = 0.0
    
    func isToTheRightOf(x:Double) -> Bool{
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
somePoint.isToTheRightOf(x: 1.0)

//mutating function
struct Point1{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
        x += deltaX
        y += deltaY
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


