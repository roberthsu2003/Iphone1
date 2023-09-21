class Food{
    var name:String
    init(name:String){
        self.name = name
    }
    
    convenience init(){
        self.init(name: "unnamed")
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

class ShoppingListItem:RecipeIngredient{
    var purchased = false
    var description:String{
        var output = "\(quantity) x \(name)"
        output += purchased ? "ok" : "not ok"
        return output
    }
}




