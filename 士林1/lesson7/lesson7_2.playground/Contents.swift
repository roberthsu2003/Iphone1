import UIKit

class Vehicle{
    var currentSpeed = 0.0
    var description:String{
        return "traveling at \(currentSpeed) km/h"
    }
    
    func makeNoise(){
        
    }
}

class Bicycle:Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print(bicycle.description)
bicycle.makeNoise()

