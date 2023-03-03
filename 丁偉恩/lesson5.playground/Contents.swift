struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

someResolution.width

someVideoMode.resolution.width
someVideoMode.resolution.width = 1280

//someResolution.width = 1280

//struct memberwise initializor
Resolution(width: 640, height: 480)


//enumerator and struct are value type

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

hd.width


enum CompasssPoint{
    case north, south, east, west
    mutating func turnNorth(){
        self = .north
    }
}

var currentDirection = CompasssPoint.west
currentDirection.turnNorth()
currentDirection
