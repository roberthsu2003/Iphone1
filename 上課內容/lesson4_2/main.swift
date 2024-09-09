struct Resolution{
	var width = 0
	var height = 0
}

class VideoMode{
	var resolution = Resolution()
	var interlaced = false
	var frameRate = 0
	var name:String?
}

let someResolution = Resolution()
print(someResolution.width)
print(someResolution.height)

let someVideoMode = VideoMode()
print(someVideoMode.resolution.width)
print(someVideoMode.resolution.height)
print(someVideoMode.interlaced)
print(someVideoMode.name ?? "是nil")
