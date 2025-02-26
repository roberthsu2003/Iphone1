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



