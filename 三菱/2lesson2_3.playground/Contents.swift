class Customer{
    let name:String
    var card:CreditCard?
    init(name:String){
        self.name = name
    }
    
    deinit{
        print("\(name)記憶體被釋放")
    }
}

class CreditCard{
    let number:UInt64
    unowned let customer:Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit{
        print("Card 被釋放")
    }
}

var john:Customer?
john = Customer(name: "hone")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)

john = nil



