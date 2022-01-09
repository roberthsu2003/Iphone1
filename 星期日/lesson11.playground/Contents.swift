//定義自訂的列舉
enum CompassPoint{
    case north
    case south
    case east
    case west
}

//利用推測
//使用列舉
var directionToHead = CompassPoint.north
directionToHead = .east

enum Planet{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
