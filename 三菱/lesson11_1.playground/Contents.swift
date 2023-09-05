class Counter{
    var count = 0
    //定義3個實體方法
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
counter.increment(by: 6)
counter.reset()
