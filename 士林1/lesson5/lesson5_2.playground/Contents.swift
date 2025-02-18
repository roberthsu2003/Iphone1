import UIKit

class Counter{
    var count = 0
    
    func increment(){ //實體方法
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
counter.count
counter.increment()
counter.count

counter.increment(by: 10)
counter.count

counter.reset()
counter.count

