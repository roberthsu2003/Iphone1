import UIKit

class Customer{
    let name:String
    var card:CreditCard?
    init(name:String){
        self.name = name
    }
    
    deinit{
        print("\(name)記憶體被消除")
    }
}

class CreditCard{
    let number:UInt64
    unowned let customer:Customer
    init(number:UInt64, customer:Customer){
        self.number = number
        self.customer = customer
    }
    
    deinit{
        print("Card #\(number)記憶體被消除")
    }
}

var john:Customer?
john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012, customer: john!)

john = nil
