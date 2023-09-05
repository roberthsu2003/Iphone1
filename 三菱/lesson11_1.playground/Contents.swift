class Counter{
    var count = 0
    //定義3個實體方法
    func increment(){
        self.count += 1
    }
    
    func increment(by amount:Int){
        self.count += amount
    }
    
    func reset(){
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 6)
counter.reset()

//有一個狀況一定要用self,當參數名稱和property是相同名稱時

struct Point{
    var x = 0.0, y = 0.0
    func isToTheRightOf(x:Double) -> Bool{
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0){
    print("實體的x,大於參數1.0")
}
