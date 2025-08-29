import UIKit

//自訂結構
struct Resolution{
    var width = 0
    var height = 0
}

//自訂類別
class VideoMode{
    var resolution = Resolution()
    var interlanced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution() //初始化
let someVideoMode = VideoMode() //初始化

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480) //智慧型成員初始化,只有結構有
print("The width of VGA is \(vga.width)")
print("The height of VGA is \(vga.height)")

//結構是Value Type
//類別是Reference Type


