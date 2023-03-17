class Vehicle{
    var numberOfWheels = 0
    var description:String{
        return "\(numberOfWheels)輪子"
    }
}

let vehicle = Vehicle()
vehicle.description

class Bicycle:Vehicle{
    override init(){
        super.init()
        numberOfWheels = 2
        
    }
}

let bicycle = Bicycle()
bicycle.description



