struct SomeStructure{
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty:Int{
            return 1
    }
}

SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty


class SomeClass{
    static var storedTypeProperty = "Some Value."
    class var overrideableComputedTypeProperty:Int{
        return 107
    }
}

SomeClass.storedTypeProperty
SomeClass.overrideableComputedTypeProperty


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
counter.increment(by: 5)
counter.reset()

let counter1 = Counter();
counter1.increment()
counter1.increment(by: 8)


struct Point{
    var x=0.0, y=0.0
    
    func isToTheRightOf(x:Double) -> Bool{
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
somePoint.isToTheRightOf(x: 6.0)

