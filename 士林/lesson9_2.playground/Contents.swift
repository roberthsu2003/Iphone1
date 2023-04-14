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




