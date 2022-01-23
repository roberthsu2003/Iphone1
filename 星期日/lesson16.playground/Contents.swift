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


