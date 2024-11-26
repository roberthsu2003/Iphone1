import UIKit

struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlanced = false
    var frameRate = 0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)
someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width)

let vga = Resolution(width: 640, height: 480) //memberwise initializer

//結構和列舉是value type
let hd = Resolution.init(width: 1920, height: 1080)

var cinema = hd
cinema.width = 2048
print(hd.width)
print(cinema.width)


enum CompassPoint{
    case north, south, east, west
    mutating func turnNorth(){
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()
print(rememberedDirection)
print(currentDirection)

//class是Reference
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlanced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30

tenEighty.frameRate




