struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlanced = false
    var frameRate = 0.0
    var name:String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

someResolution.width
someResolution.height
//someResolution.width  = 100

someVideoMode.resolution.width
someVideoMode.resolution.height
someVideoMode.frameRate

someVideoMode.resolution.width = 1280

let vga = Resolution(width: 640, height: 480)  // 智慧型成員初始化

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
hd.width





