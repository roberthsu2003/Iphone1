class Vehicle{
    var numberOfWheel = 0 //store property
    var description:String{
        return "\(numberOfWheel)個輪子"
    } //computed property
}

let vehicle = Vehicle()
vehicle.description

class Bicycle:Vehicle{
    override init(){
        //step1:現讓自已所有的storeproperty有值
        //step2:super.init
        //step3:使用繼承來的store property和method
        super.init()
        numberOfWheel = 2
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


class Food{
    var name:String
    init(name:String){
        self.name = name
    }
    
    convenience init(){
        self.init(name: "沒有名稱")
    }
}

let nameMeat = Food(name: "Bacon")
let mysteryMeat = Food()


class RecipeIngredient:Food{
    var quantity:Int
    init(name:String, quantity:Int){
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









