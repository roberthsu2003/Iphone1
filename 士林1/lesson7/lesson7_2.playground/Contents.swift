import UIKit

class Vehicle{
    var currentSpeed = 0.0
    var description:String{
        return "traveling at \(currentSpeed) km/h"
    }
    
    func makeNoise(){
        print("有一些基本的東西,要設定")
    }
}

class Bicycle:Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print(bicycle.description)
bicycle.makeNoise()

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print(tandem.description)
tandem.makeNoise()

class Train:Vehicle{
    override func makeNoise(){
        super.makeNoise()
        print("Choo Choo")
    }
}

let train = Train()
train.currentSpeed = 88.0
train.makeNoise()

