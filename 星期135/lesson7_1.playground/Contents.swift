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

class RecipeIngredient:Food{
    var quantity:Int
    init (name:String, quantity:Int){
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name:String){
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

