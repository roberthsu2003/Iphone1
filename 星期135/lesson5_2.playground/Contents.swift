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
