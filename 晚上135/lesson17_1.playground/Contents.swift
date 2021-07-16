import UIKit

enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeds:Int)
    case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeds: 5)
