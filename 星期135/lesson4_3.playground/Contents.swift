enum CompassPoint{
    case north
    case south
    case east
    case west
}

var directionToHead:CompassPoint = .east
directionToHead = .west

//使用switch case來檢查列舉所儲存的值

switch directionToHead{
case .north:
    print("north")
case .west:
    print("west")
case .east:
    print("east")
case .south:
    print("South")
}

enum Planet{
    case mercury, venus, earth, mars, jupiter, saturn ,uranus, neptune
}

let somePlanet = Planet.jupiter

switch somePlanet{
case .earth:
    print("地球")
default:
    print("其它星球")
}
