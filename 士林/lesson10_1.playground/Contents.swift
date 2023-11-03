enum CompassPoint{
    case north
    case south
    case east
    case west
}

var directionToHead = CompassPoint.west

//定義自訂的結構
struct Resolution{
    var width = 0
    var height = 0
}

var someResolution = Resolution()
someResolution.width = 100
someResolution.height = 150


var someResolution1 = Resolution()
someResolution1.width = 10
someResolution1.height = 15
