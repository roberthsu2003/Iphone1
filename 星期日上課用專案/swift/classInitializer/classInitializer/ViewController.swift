//
//  ViewController.swift
//  classInitializer
//
//  Created by 徐國堂 on 2021/5/2.
//

import UIKit
class Vehicle{
    var numberOfWheels = 0
    var description:String{
        return "\(numberOfWheels)輪子"
    }
}

class Bicycle:Vehicle{
    override init(){
        super.init()
        numberOfWheels = 2
    }
}

class Hoverboard:Vehicle{
    var color:String;
    init(color:String){
        self.color = color
        super.init()
        numberOfWheels = 0
    }
    
    override var description: String{
        return "\(color)色的\(super.description)"
    }
}

class Food{
    var name:String
    init(name:String){
        self.name = name;
    }
    
    convenience init(){
        self.init(name:"[unnamed]")
    }
}

class RecipeIngredient:Food{
    var quantity:Int
    
    init(name:String, quantity:Int){
        self.quantity = quantity
        super.init(name: name)
    }
    
    convenience override init(name:String){
        self.init(name:name,quantity:1)
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vehicle = Vehicle()
        print("Vehicle:\(vehicle.description)")
        
        let bicycle = Bicycle()
        print("Bicycle:\(bicycle.description)")
        
        let hoverboard = Hoverboard(color: "silver")
        print("Hoverboard:\(hoverboard.description)")
        
        
        let namedMeat = Food(name: "Bacon")
        let mysteryMeat = Food()
        
        
        let oneMysteryItem = RecipeIngredient()
        let oneBacon = RecipeIngredient(name: "Bacon")
        let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
    }


}

