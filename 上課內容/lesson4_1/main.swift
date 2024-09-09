enum CompassPoint{
	case north
	case south
	case east
	case west
}

enum Planet{
	case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//var directionToHead:CompassPoint = .west
var directionToHead = CompassPoint.west
directionToHead = .east

//列舉變數是使用那一個成員
//switch...case

switch directionToHead{
	case .north:
		print("north")
	case .south:
		print("south")
	case .east:
		print("east")
	case .west:
		print("west")
}

let somePlanet = Planet.earth
//somePlanet = .mars

switch somePlanet{
	case .earth:
	print("地球")
	default:
	print("沒有人住的星球")
}
