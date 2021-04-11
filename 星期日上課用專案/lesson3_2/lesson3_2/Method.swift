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

struct Point{
    var x = 0.0, y = 0.0;
    func isToTheRightOf(x:Double) -> Bool{
        return self.x > x
    }
}
