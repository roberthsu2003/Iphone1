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
someVideoMode.resolution.width = 1280
someVideoMode.resolution.width
