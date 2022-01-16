//實體method可以直接存取實體的property
//存取實體的property(self.property)
class Counter{
    //實體property
    var count = 0
    
    //實體method
    func increment(){
        self.count += 1
    }
    
    func increment(by amount:Int){
        self.count += amount
    }
    
    func reset(){
        self.count = 0;
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

struct Point{
    var x=0.0, y=0.0;
    func isToTheRighOf(x:Double) -> Bool{
        return self.x > x;
    }
}


