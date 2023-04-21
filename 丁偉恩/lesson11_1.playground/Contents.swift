enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfStock
}
/*
 throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
 print("hello")
 */

func cannotThrowErrors() -> String{
    return "abc"
}

func canThrowErrors()throws -> String{
    print("hello")
    throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
    
}
