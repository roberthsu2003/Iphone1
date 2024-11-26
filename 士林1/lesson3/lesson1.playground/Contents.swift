import UIKit

enum CompassPoint:String {
    case north
    case east
    case south
    case west
}

enum Planet:Int {
    case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var direcToHead = CompassPoint.north
direcToHead = .south

switch direcToHead {
case .east:
    print("East")
case .south:
    print("South")
case .north:
    print("north")
case .west:
    print("West")
}

direcToHead.rawValue

let planet = Planet.earth
print(planet.rawValue)
