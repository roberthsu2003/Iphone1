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



