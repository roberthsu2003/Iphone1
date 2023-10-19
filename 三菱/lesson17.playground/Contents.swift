class Bank{
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested:Int)->Int{
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins:Int){
        coinsInBank += coins
    }
}

class Player{
    var coinsInPurse:Int
    init(coins:Int){
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins:Int){
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit{
        print("實體被消滅")
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne:Player? = Player(coins: 100)
print("player的coins是\(playerOne!.coinsInPurse)")
print("bank的coins是\(Bank.coinsInBank)")

playerOne!.win(coins: 2_000)
print("player的coins是\(playerOne!.coinsInPurse)")
print("bank的coins是\(Bank.coinsInBank)")

playerOne = nil

print("bank的coins是\(Bank.coinsInBank)")

