//定義一個列舉型別
enum CompassPoint{
    case north
    case south
    case east
    case west
}

enum Planet{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//建立列舉型別的變數
var directionToHead = CompassPoint.west
directionToHead = .east
directionToHead = .south

//檢查列舉型別變數內儲存的值是?
//使用switch...case

switch directionToHead{
    case .east:
        print("東")
    case .north:
        print("北")
    case .south:
        print("南")
    case .west:
        print("西")
}
