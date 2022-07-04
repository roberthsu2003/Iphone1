import UIKit

//定義一個錯誤的列舉
enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
