import UIKit

class Vehicle{
    var curretSpeeed = 0.0
    var description:String{
        return "每小時\(curretSpeeed)公里"
    }
    
    func makeNoise(){
        
    }
}

class Bicycle:Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.curretSpeeed = 15.0
print("bicycle:\(bicycle.description)")

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.curretSpeeed = 22.0

print("Tandem:\(tandem.description)")


//override method
class Train:Vehicle{
    override func makeNoise(){
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

//override properties
class Car:Vehicle{
    var gear = 1
    override var description: String{
        return super.description + "在第\(gear)檔"
    }
}

let car = Car()
car.curretSpeeed = 25.0
car.gear = 3
print("Car:\(car.description)")

//override property

class AutomaticCar:Car{
    override var curretSpeeed: Double{
        didSet{
            gear = Int(curretSpeeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.curretSpeeed = 35.0
print("AutomaticCar:\(automatic.description)")

//預防子類別覆寫

//final var
//final func
//final class func
//final subscript

//預防子類別繼承
//final class


