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
