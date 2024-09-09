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

//結構
//default init
//智慧型成員初始化
let hd = Resolution(width: 1920, height: 1080)
//value type 是把hd的實體,copy一份給sinema
var cinema = hd
cinema.width = 2048
print(hd.width)
print(cinema.width)


let someVideoMode1 = someVideoMode

someVideoMode1.resolution.width = 1920
someVideoMode1.resolution.height = 1080

print(someVideoMode.resolution.width)
print(someVideoMode.resolution.height)

