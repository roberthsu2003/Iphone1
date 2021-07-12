//baseclass
class Vehicle{
    var numberOfWheels = 0
    var description:String{
        return "有\(numberOfWheels)輪子"
    }
}

let vehicle = Vehicle()
vehicle.description

