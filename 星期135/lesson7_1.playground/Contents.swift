import UIKit

class Vehicle{
    var numberOfWheels = 0
    var description:String{
        return "\(numberOfWheels) wheel(s)"
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

class Hoverboard:Vehicle{
    var color:String
    init(color:String){
        self.color = color
        super.init()
    }
    
    override var description: String{
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
hoverboard.description


class Food{
    var name:String
    init(name:String){
        self.name = name
    }
    
    convenience init(){
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

