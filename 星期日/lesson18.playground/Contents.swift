class Vehicle{
    var numberOfWheel = 0 //store property
    var description:String{
        return "\(numberOfWheel)個輪子"
    } //computed property
}

let vehicle = Vehicle()
vehicle.description
