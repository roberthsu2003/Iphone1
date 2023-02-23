enum CompassPoint{
    case north
    case south
    case east
    case west
}

var directionToHead = CompassPoint.north

//directionToHead = .east

switch directionToHead{
case .north:
    print("北")
case .east:
    print("東")
case .south:
    print("南")
case .west:
    print("西")
}

