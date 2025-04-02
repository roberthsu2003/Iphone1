class Bank{
    nonisolated(unsafe) static var coinsInBank: Int = 10_000
    static func distribute(coint numberOfCoinsRequested:Int) -> Int{
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
    init(coins: Int) {
        self.coinsInPurse = coins
    }
    
    func win(coins:Int){
        coinsInPurse += Bank.distribute(coint: coins)
    }
    
    deinit{
        print("不玩了，退还 \(coinsInPurse) coins")
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne:Player? = Player(coins: 100)
playerOne!.win(coins: 2_000)
print("玩家一共拥有 \(playerOne!.coinsInPurse) coins")
playerOne = nil




