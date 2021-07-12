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

class Hoverboard:Vehicle{
    var color:String
    init(color:String){
        //先讓store property有值
        self.color = color
        //執行父類別的designated initializer
        super.init()
        
    }
    
    override var description:String{
        return "\(super.description),漂亮的顏色是:\(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("hoverboard:\(hoverboard.description)")

class Food{
    var name:String
    init(name:String){
        self.name = name
    }
    
    convenience init(){
        self.init(name:"[Unnamed]")
    }
    
}




