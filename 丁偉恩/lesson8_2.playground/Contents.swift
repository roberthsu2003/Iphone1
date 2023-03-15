class Vehicle{
    var currentSpeed = 0.0
    var description:String{
        return "目前速度是\(currentSpeed)"
    }
    
    func makeNoise(){
        
    }
}

let someVehicle = Vehicle()
someVehicle.currentSpeed
someVehicle.description


class Bicycle:Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
bicycle.description

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
tandem.description


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
    override var description:String{
        return super.description + "檔速為\(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
car.description

class AutomaticCar:Car{
    override var currentSpeed:Double{
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
automatic.description

