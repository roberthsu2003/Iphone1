//Enumeration

enum CompassPoint{
    case north
    case south
    case east
    case west
}
/*
enum Planet{
    case mercury, venus, earth, mars, jupiter, asturn, uranus, neptune
}
 */
var directionToHead = CompassPoint.west
directionToHead = .north

//檢查列舉的內容,請使用switch case

switch directionToHead{
case .north:
    print("north")
case .west:
    print("west")
case .south:
    print("south")
case .east:
    print("east")
}

enum Planet:Int{
    case mercury=1, venus, earth, mars, jupiter, asturn, uranus, neptune
}

let somePlanet = Planet.earth
switch somePlanet{
case .earth:
    print("earth")
default:
    print("other")
}

//列舉的常數可以被travel

enum Beverage:CaseIterable{
    case coffee, tea ,juice
}

Beverage.allCases.count

for beverage in Beverage.allCases{
    print(beverage)
}

Planet.earth.rawValue

if let possiblePlanet = Planet(rawValue: 1){
    possiblePlanet.rawValue
}
func test() -> Void{
    guard let possiblePlanet = Planet(rawValue: 1) else{
        return
    }
    print(possiblePlanet.rawValue)
}

test()


