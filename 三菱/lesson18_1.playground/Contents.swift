enum VendingMachineError:Error{
    case invalidSelection
    case insufficentFunds(coinsNeeds:Int)
    case outOfStock
}

throw VendingMachineError.invalidSelection

//建立一個會throws的function
func canThrowErrors() throws -> String{
    return "Hello!"
}

func cannotThrowErrors() -> String{
    return "Hello!"
}

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
            //false
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else{
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else{
            throw VendingMachineError.insufficentFunds(coinsNeeds: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
        
    }
}

//propagate(傳遞錯誤)
//try
let favoriteSnacks = [
    "Alice":"Chips",
    "Bob":"Licorice",
    "Eve":"Pretzels"
]

func buyFavoriteSnack(person:String, vendingMachine:VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchesedSnack{
    let name:String
    init(name:String, vendingMachine:VendingMachine) throws{
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
