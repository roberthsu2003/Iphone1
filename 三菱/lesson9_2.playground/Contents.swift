// computed property

struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    //computed property
    //computed property必需明確宣告資料類型
    var center:Point{
        get{
            //傳出,必需有return
            let centerX = origin.x + size.width / 2.0
            let centerY = origin.y + size.height / 2.0
            return Point(x: centerX, y: centerX)
        }
        set{
            //傳入,使用newCenter
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
initialSquareCenter.x
initialSquareCenter.y

square.center = Point(x: 15.0, y: 15.0)
square.origin.x
square.origin.y


// read-only computed Properties
struct Cuboid{
    var width = 0.0, height = 0.0, depth = 0.0
    //read only computed property
    var volume:Double{
            return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
fourByFiveByTwo.volume



