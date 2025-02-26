import UIKit

class Counter{
    var count = 0
    //實體的method
    func increment(){
        count += 1
    }
    
    func increment(by amount: Int){
        count += amount
    }
    
    func reset(){
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 10)


//參數名稱和property是相同的名稱

struct Point{
    var x=0.0, y=0.0
    
    func isToTheRightOf(x:Double) -> Bool{
        return self.x > x
    }
}

//mutating func

struct Point1{
    var x=0.0, y=0.0
    
    mutating func moveBy(x:Double, y:Double){ //mutating func才可以更改store property
        self.x += x
        self.y += y
    }
}


struct Point2{
    var x=0.0, y=0.0
    
    mutating func moveBy(x:Double, y:Double){ //mutating func才可以更改store property
        self = Point2(x: x + self.x, y: y + self.y)
    }
}

enum TriStateSwitch{
    case off, low, high
    
    mutating func toggle(){
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
ovenLight.toggle()
ovenLight.toggle()
ovenLight.toggle()







