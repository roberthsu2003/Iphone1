import UIKit

//列舉
enum CompassPoint{
    case north
    case south
    case east
    case west
}

//明確宣告
//var directionToHeat:CompassPoint = CompassPoint.north

//不明確宣告
var directionToHeat = CompassPoint.north
directionToHeat = .south
