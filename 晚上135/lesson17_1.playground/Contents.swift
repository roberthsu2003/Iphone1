import UIKit

enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeds:Int)
    case outOfStock
}



func canThrowError(num:Int) throws -> String{
    if num == 10{
        throw VendingMachineError.insufficientFunds(coinsNeeds: 5)
    }
    
    return "有傳出字串"
}

