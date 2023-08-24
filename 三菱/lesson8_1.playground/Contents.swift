//定義結構,類別的語法

struct SomeStructure{
    
}

class SomeClass{
    
}

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
someResolution.width
someResolution.height

let someVideoMode = VideoMode()
someVideoMode.resolution.width
someVideoMode.resolution.height
someVideoMode.interlaced
someVideoMode.name
someVideoMode.frameRate

someVideoMode.resolution.width = 1280
someVideoMode.resolution.width

let vga = Resolution(width: 640, height: 480)
vga.width
vga.height

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
hd.width
cinema.width
