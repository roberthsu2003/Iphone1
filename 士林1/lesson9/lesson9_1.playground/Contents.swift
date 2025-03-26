import UIKit

class Vehicle{
    var numberOfWheels: Int = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print(vehicle.description)


class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color:String
    init(color: String) {
        self.color = color
        //super.init() -> 第2階段沒有做任何動作可以省略,它會自執行
        
    }
    convenience override init(){
        self.init(color: "white")
    }
}


Hoverboard()
