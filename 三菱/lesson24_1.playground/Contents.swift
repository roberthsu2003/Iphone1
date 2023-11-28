import Foundation

@objc protocol CounterDataSource{
    @objc optional func increment(forCount count:Int) -> Int
    @objc optional var fixedIncrement:Int {get}
}

class Counter{
    var count = 0
    var dataSource:CounterDataSource?
}

class ThreeSource:NSObject,CounterDataSource{
    let fixedIncrement = 3
}

class ToWardsZeroSource:NSObject, CounterDataSource{
    func increment(forCount count:Int) -> Int{
        if count == 0{
            return 0
        }else if count < 0{
            return 1
        }else{
            return -1
        }
    }
}

var counter = Counter()
counter.dataSource = ThreeSource()
