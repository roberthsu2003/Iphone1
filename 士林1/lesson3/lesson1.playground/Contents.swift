import UIKit

enum CompassPoint {
    case north
    case east
    case south
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
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
