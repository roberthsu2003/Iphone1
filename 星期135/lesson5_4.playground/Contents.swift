//Inheritance
//繼承
//base class

class Vehicle{
    var currentSpeed = 0.0
    var description:String{
        return "交通工具目前的速度是每小時\(currentSpeed)公里"
    }
    func makeNoise(){
        
    }
}

let someVehicle = Vehicle()
someVehicle.currentSpeed = 50
someVehicle.description
