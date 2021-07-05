class Vehicle{
    var currentSpeed = 0.0
    var description:String{
        return "現在速度是每小時\(currentSpeed)公里"
    }
    func makeNoise(){
        //do nothing
    }
}

let someVehicle = Vehicle()
someVehicle.description
