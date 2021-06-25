var x = 10
var y = x

x += 1;
y += 2;
x
y


var xArray = [10, 11, 12]
var yArray = xArray

xArray[0] = 100
yArray[0] = 1000

xArray
yArray

func addTwoInts(_ a:Int,_ b:Int) -> Int{
    return a + b
}

var ref1 = addTwoInts

var ref2 = ref1

ref1(10, 20)
ref2(10, 20)

//列舉型別
enum CompassPoint{
    case north
    case south
    case east
    case west
}

var directionToHead = CompassPoint.north
directionToHead = .east

//檢查列舉內儲存的值,使用switch case
switch directionToHead{
case .north:
    print("向北")
case .south:
    print("向南")
case .east:
    print("向東")
case .west:
    print("向西")
}
