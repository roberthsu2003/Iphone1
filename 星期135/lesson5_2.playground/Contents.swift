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
