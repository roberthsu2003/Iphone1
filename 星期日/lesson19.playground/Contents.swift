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


