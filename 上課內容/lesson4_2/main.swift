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

var someResolution = Resolution()
someResolution.width = 1027
someResolution.height = 768

print(someResolution.width)
print(someResolution.height)

let someVideoMode = VideoMode()
someVideoMode.resolution.width = 1024
someVideoMode.resolution.height = 768

print(someVideoMode.resolution.width)
print(someVideoMode.resolution.height)
print(someVideoMode.interlaced)
print(someVideoMode.name ?? "是nil")
