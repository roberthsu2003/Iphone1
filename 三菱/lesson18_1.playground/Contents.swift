enum VendingMachineError:Error{
    case invalidSelection
    case insufficentFunds(coinsNeeds:Int)
    case outOfStock
}

throw VendingMachineError.invalidSelection
