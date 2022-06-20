//定義結構
struct SomeStructure{
    
}
//定義類別
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
let someVideoMode = VideoMode()

someResolution.width
someResolution.height


someVideoMode.resolution.width
someVideoMode.resolution.height

someVideoMode.resolution.width = 1280
someVideoMode.resolution.width

//結構有2種內建的初始化
//default init
//成員init

let vga = Resolution(width: 640, height: 480)

//結構是value type
vga.width
//vga.width = 800 //value type let,無法更改屬性
//value type使用=就是複制一個實體

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
hd.width
cinema.width


