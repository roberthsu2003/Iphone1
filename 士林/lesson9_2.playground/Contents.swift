import UIKit

//定義列舉
enum CompassPoint{
    case north
    case south
    case east
    case west
}

//使用列舉
var directionToHead = CompassPoint.west
directionToHead = .east

//檢查列舉內的值,使用switch

switch(directionToHead){
case .east:
    print("東")
case .north:
    print("北")
case .south:
    print("南")
case .west:
    print("西")
}

//列舉的純值
enum Planet:Int{
    case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earths = Planet.earth
earths.rawValue

if let mars_planet = Planet(rawValue: 4){ //optional binding
    mars_planet
}





