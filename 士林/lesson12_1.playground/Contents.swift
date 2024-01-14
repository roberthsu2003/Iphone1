struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlace = false
    var frameRate = 0.0
    var name:String?
}

let someVideoMode = VideoMode()
someVideoMode.resolution.width
someVideoMode.resolution.height

someVideoMode.resolution.width = 100
someVideoMode.resolution.height = 200

someVideoMode.resolution.width
someVideoMode.resolution.height


let someResolution = Resolution()
someResolution.width
//someResolution.width = 100

var someResolution1 = Resolution()
someResolution1.width
someResolution1.width = 100

let vga = Resolution(width: 640, height: 480)
vga.width
vga.height

//vga.width = 800

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width
cinema.height

cinema.width = 2048
hd.width


enum CompassPoint{
    case north, south, east, west
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection

currentDirection
rememberedDirection


currentDirection = .north
currentDirection
rememberedDirection

let tenEighty = VideoMode()
//tenEighty = VideoMode()

//reference type

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0


tenEighty.frameRate

//==
//compare Operator
//2邊的值是否一樣

//identity Operator
//識別運算子
//===
//!==
//它們參考的是不是同一個實體

alsoTenEighty === tenEighty





