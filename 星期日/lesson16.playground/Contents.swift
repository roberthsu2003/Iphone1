class Vehicle{
    var currentSpeed = 0.0; //store property
    var description:String{ //computed property(get)
        return "目前速度是\(currentSpeed)"
    }
    
    func makeNoise(){
        
    }
}

let someVehicle = Vehicle()
print("Vehicle:\(someVehicle.description)")

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

//Overridine覆寫
//覆寫method
class Train:Vehicle{
    override func makeNoise(){
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

//覆寫屬性

class Car:Vehicle{
    var gear = 1
    override var description: String{
        return super.description + "檔位是\(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car:\(car.description)")





