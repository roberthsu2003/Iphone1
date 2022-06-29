import UIKit

class Bank{
    static var coinsInbank = 10_000
    static func distribute(coins numberOfCoinsRequested:Int) -> Int{
        let numberOfCoinsToVend = min(numberOfCoinsRequested,coinsInbank)
        coinsInbank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins:Int){
        coinsInbank += coins;
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
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne:Player? = Player(coins: 100)
print("現在此人有\(playerOne!.coinsInPurse)coins")
print("現在銀行的有\(Bank.coinsInbank)coins")

playerOne!.win(coins: 500)
print("現在此人有\(playerOne!.coinsInPurse)coins")
print("現在銀行的有\(Bank.coinsInbank)coins")

playerOne = nil  //實體被回收了
print("現在銀行的有\(Bank.coinsInbank)coins")

