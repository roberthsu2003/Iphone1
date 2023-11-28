import Foundation

@objc protocol CounterDataSource{
    @objc optional func increment(forCount count:Int) -> Int
    @objc optional var fixedIncrement:Int {get}
}

class Counter{
    var count = 0
    var dataSource:CounterDataSource?
    
    func increment(){
        if let amount = dataSource?.increment?(forCount: count){
            count += amount
        }else if let amount = dataSource?.fixedIncrement{
            count += amount
        }
    }
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
for _ in 1...4{
    counter.increment()
    print(counter.count)
}

counter.count = -4
counter.dataSource = ToWardsZeroSource()

for _ in 1...5{
    counter.increment()
    print(counter.count)
}


protocol RandomNumberGenerator{
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

extension RandomNumberGenerator{
    func randomBool() -> Bool{
        return random() > 0.5
    }
}

let generator = LinearCongruentialGenerator()
generator.random()
generator.randomBool()

protocol TextRepresentable{
    var textualDescription:String {get}
}

protocol PrettyTextRepresentable:TextRepresentable{
    var prettyTextualDescription:String { get }
}

//提供預設實作需求
extension PrettyTextRepresentable{
    var prettyTextualDescription:String{
        return textualDescription
    }
}

class Abc:PrettyTextRepresentable{
    var textualDescription = "abc"
    
}

let abc = Abc()
abc.prettyTextualDescription


extension Collection where Element:Equatable{
    func allEqual() -> Bool{
        for element in self{
            if element != self.first{
                return false
            }
        }
        return true
    }
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]
equalNumbers.allEqual()
differentNumbers.allEqual()






