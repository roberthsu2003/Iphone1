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
    override func makeNoise(){ //override實體方法
        super.makeNoise()
        print("Choo Choo")
    }
}

let train = Train()
train.currentSpeed = 88.0
train.makeNoise()

class Car:Vehicle{
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

class AutomaticCar:Car{
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automaticCar = AutomaticCar()
automaticCar.currentSpeed = 120.0
print(automaticCar.gear)


