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

let somePlanet = Planet.earth
switch somePlanet{
case .earth:
    print("人類住的地方")
default:
    print("其它的星球")
}

enum Beverage:CaseIterable{
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print(numberOfChoices)

for beverage in Beverage.allCases{
    print(beverage)
}


