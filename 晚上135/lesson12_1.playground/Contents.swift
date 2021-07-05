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

class Bicycle:Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("目前腳踏車的速度是\(bicycle.description)")

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("協力車的速度\(tandem.description)")

//override
class Train:Vehicle{
    override func makeNoise(){
        
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car:Vehicle{
    var gear = 1
    override var description:String{
        return super.description + ",目前是第\(gear)檔"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car:\(car.description)")

