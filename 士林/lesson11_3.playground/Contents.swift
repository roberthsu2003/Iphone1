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

