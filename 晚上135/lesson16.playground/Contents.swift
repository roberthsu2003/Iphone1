import UIKit

class Bank{
    var coinsInBank = 10_000
    
    init(){
        print("記憶體被建立了")
    }
    
    deinit{
        print("記憶體被消滅了")
    }
}

var bank1:Bank? = Bank()
var bank2:Bank? = bank1
var bank3:Bank? = bank1
bank3 = nil
bank2 = nil
bank1 = nil

