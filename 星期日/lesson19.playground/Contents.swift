class Bank{
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested:Int) -> Int{
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins:Int){
        coinsInBank += coins
    }
}

Bank.coinsInBank

class Player{
    var coinsInPurse:Int
    
    init(coins:Int){
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins:Int){
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit{
        print("記憶體被回收")
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne:Player? = Player(coins: 100)
print("玩家借了\(playerOne!.coinsInPurse)幣")
print("銀行還有多少\(Bank.coinsInBank)幣")

var playerTwo:Player? = Player(coins: 200)
print("玩家借了\(playerTwo!.coinsInPurse)幣")
print("銀行還有多少\(Bank.coinsInBank)幣")

playerOne = nil
print("銀行還有多少\(Bank.coinsInBank)幣")

playerTwo = nil
print("銀行還有多少\(Bank.coinsInBank)幣")

