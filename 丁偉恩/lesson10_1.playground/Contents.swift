import UIKit

class Player{
    var coinsInPurse:Int
    init(coins:Int){
        coinsInPurse = coins
    }
    
    deinit{
        print("實體被回收了")
    }
}

var player1:Player! = Player(coins: 10)
var player2:Player! = player1
player1 = nil
player2 = nil

