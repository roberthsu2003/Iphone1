//baseclass
class Vehicle{
    var numberOfWheels = 0
    var description:String{
        return "有\(numberOfWheels)輪子"
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
print("腳踏車:\(bicycle.description)")

