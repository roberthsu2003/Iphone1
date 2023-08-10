var completionHandlers:[() -> Void] = []
func someFunctionWithEscapingClosure(completionHandle:@escaping ()->Void){
    completionHandlers.append(completionHandle)
}


func someFunctionWithNonescapingClosure(closure:()->Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure {
            [self] in
            x = 100
        }
        
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)
