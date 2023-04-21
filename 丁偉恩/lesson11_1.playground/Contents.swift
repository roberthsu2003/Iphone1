enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfStock
}
/*
 throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
 print("hello")
 */
/*
 func cannotThrowErrors() -> String{
 return "abc"
 }
 
 func canThrowErrors()throws -> String{
 print("hello")
 throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
 
 }
 */
struct Item{
    var price:Int
    var count:Int
}

class VendingMachine{
    var inventory = [
        "Candy Bar":Item(price: 12, count: 7),
        "Chips":Item(price: 10, count: 4),
        "Pretzels":Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name:String) throws{
        guard let item = inventory[name] else{
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else{
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else{
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price-coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item;
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing\(name)")
        
    }
}



