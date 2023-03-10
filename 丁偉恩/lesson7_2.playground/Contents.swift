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

