import UIKit

class Vehicle{
    var curretSpeeed = 0.0
    var description:String{
        return "每小時\(curretSpeeed)公里"
    }
    
    func makeNoise(){
        
    }
}

class Bicycle:Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.curretSpeeed = 15.0
print("bicycle:\(bicycle.description)")

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.curretSpeeed = 22.0

print("Tandem:\(tandem.description)")
