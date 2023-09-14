class Vehicle{
    var currentSpeed = 0.0
    var description:String{
        return "速度是\(currentSpeed)"
    }
    
    func makeNoise(){
        //沒有做任何事
        //主要是繼承給子類別
    }
    
}

let someVehicle = Vehicle()
print("Vehicle:\(someVehicle.description)")

class Bicycle:Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.currentSpeed = 15.0
print("Bicycle:\(bicycle.description)")

class Tandem:Bicycle{
    var currentNumberOfpassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentSpeed = 22.0
tandem.currentNumberOfpassengers = 2
print("Tandem:\(tandem.description)")

//override method
class Train:Vehicle{
    override func makeNoise(){
        //super.makeNoise()
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

//override property(改變方法)
class Car:Vehicle{
    var gear = 1
    override var description:String{
        return "\(super.description),目前檔數是:\(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3

print("Car:\(car.description)")

class AutomaticCar:Car{
    override var currentSpeed:Double{
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print(automatic.currentSpeed)
print(automatic.description)

