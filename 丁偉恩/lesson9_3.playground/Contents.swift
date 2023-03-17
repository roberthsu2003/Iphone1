class Vehicle{
    var numberOfWheels = 0
    var description:String{
        return "\(numberOfWheels)輪子"
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
        return "\(super.description),顏色是\(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
hoverboard.description

//自動繼承
//如果沒有自訂的init(),全部繼承父類別的
//如果自訂的init(),有所有父類別的主要的init(),次要的init會自動繼承
//如果自訂的init(),和所有父類別的主要的init()不同,不會繼承

class Food{
    var name:String
    init(name:String){
        self.name = name
    }
    convenience init(){
        self.init(name:"沒有名字")
    }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()


class RecipeIngredient:Food{
    var quantity:Int
    init(name:String, quantity:Int){
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)


struct Animal{
    let species:String
    
    init?(species:String){
        if species.isEmpty {
            return nil
        }
        
        self.species = species
    }
}

if let someCreature = Animal(species: "Giraffe"){
    someCreature
}








