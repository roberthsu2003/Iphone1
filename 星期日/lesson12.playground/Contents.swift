struct Resolution{
    var width = 0;
    var height = 0;
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
someResolution.height

someVideoMode.interlaced
someVideoMode.name
someVideoMode.frameRate
someVideoMode.resolution.width
someVideoMode.resolution.height

someVideoMode.resolution.width = 1280
someVideoMode.resolution.height = 960

someVideoMode.resolution.width
someVideoMode.resolution.height

let vga = Resolution(width: 640, height: 480)
vga.width
vga.height

