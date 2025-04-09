enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfStock
}

struct Item{
    var price:Int
    var count:Int
}

class VendingMachine{
    var inventory = [
        "Candy Bar":Item(price: 12, count: 7),
        "Chips":Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var conisDeposited = 0
    
    func vend(itemNamed name:String) throws{
        guard let item = inventory[name] else{
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else{
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= conisDeposited else{
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - conisDeposited)
        }
        
        conisDeposited -= item.price
        
        var oneItem = inventory[name]
        oneItem?.count -= 1
        inventory[name] = oneItem
        
        print("Dispensing \(name)")
        
    }
}

let favoriteSnack = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person:String, vendingMachine:VendingMachine) throws{
    let snackName = favoriteSnack[person] ?? "Candy Bar"
    //try! vendingMachine.vend(itemNamed: snackName) //不會出錯啦!出錯crash
    
    /*
    if (try? vendingMachine.vend(itemNamed: snackName)) == nil {
        
    }
     */
    
    /*
    //直接處理錯誤了
    do{
        try vendingMachine.vend(itemNamed: snackName)
    }catch{
        print("出錯了")
    }
     */
    try vendingMachine.vend(itemNamed: snackName)
}
var vendingMachine = VendingMachine()
vendingMachine.conisDeposited = 8
do{
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
}catch VendingMachineError.invalidSelection{
    print("沒有這個商品")
}catch VendingMachineError.outOfStock{
    print("沒貨了")
}catch VendingMachineError.insufficientFunds(let coinsNeeded){
    print("不夠\(coinsNeeded)錢")
}catch{
    print("不知道的錯誤")
}
