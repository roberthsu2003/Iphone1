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

//value type
//使用指定運算子時,copy一份實體
//let代表常數，不可以修改屬性

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2400
cinema.height = 1800
cinema.width


//class 是reference Type
//搖控器的想法

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate=25.0


let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty.frameRate

