import UIKit

enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeds:Int)
    case outOfStock
}


/*
func canThrowError() throws -> String{
    let a = 10
    if a == 10{
        throw VendingMachineError.insufficientFunds(coinsNeeds: 5)
    }
    
    return "abc"
}
 */
