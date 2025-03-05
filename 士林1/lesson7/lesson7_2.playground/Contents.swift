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
