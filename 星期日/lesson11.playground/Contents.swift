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
directionToHead = .south

enum Planet{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

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

var somePlanet = Planet.earth
somePlanet = .jupiter
switch somePlanet{
case .earth:
    print("地球")
default:
    print("地球以外的")
}

//建立可以被一個一個讀取的值的列舉
enum Beverage:CaseIterable{
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count

for beverage in Beverage.allCases{
    print(beverage)
}

//case 元素有關聯的值
enum Barcode{
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
//productBarcode = .qrCode("ABCDEFGHIJK")

switch productBarcode{
case let .upc( numberSystem,manufacturer,product,check):
    print("\(numberSystem)-\(manufacturer)-\(product)-\(check)")
case let .qrCode(productCode):
    print(productCode)
}


