//capture values
func makeIncrementer(forIncrement amount:Int) -> () -> Int{
    var runningTotal = 0
    func incrementer() -> Int{
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementBySeven()
incrementBySeven()

incrementByTen()

//closure 是reference的type
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

//escaping closure

var completionHandlers:[() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler:@escaping () -> Void){
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure:()->Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        
        someFunctionWithNonescapingClosure{
            x = 200
        }
    }
}

class SomeClass1{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure {
            [self] in
            x = 100
        }
        
        someFunctionWithNonescapingClosure{
            x = 200
        }
    }
}

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func serve(customer customerProvider:()->String){
    print("Now serving \(customerProvider())!")
}

serve(customer: {
    customersInLine.remove(at: 0)
})

func serve1(customer customerProvider:@autoclosure ()->String){
    print("Now serving \(customerProvider())!")
}

//serve1(customer:customersInLine.remove(at: 0))
serve1(customer:customersInLine.remove(at: 0))



