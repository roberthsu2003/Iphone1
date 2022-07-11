import UIKit
//Extention computed property

extension Double{
    var km:Double{
        return self * 1_000.0
    }
    
    var m:Double{
        return self
    }
    
    var cm:Double{
        return self / 100.0
    }
    
    var mm:Double{
        return self / 1_000.0
    }
    
    var ft:Double{
        return self / 3.28084
    }
}

let oneInch = 25.4.mm;
print("one inch is \(oneInch) meters")

let threeFeet = 3.ft
print("three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("aMarathon is \(aMarathon) meters long")


//擴充initializer

struct Size{
    var width=0.0, height=0.0
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect{
    init(center:Point, size:Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

centerRect.origin.x
centerRect.origin.y

//擴充method
extension Int{
    func repetitions(task:()->Void){
        for _ in 0..<self{
            task()
        }
    }
}

3.repetitions{
    print("Hello!")
}

//擴充subscript
extension Int{
    subscript(digitIndex:Int) -> Int{
        var decimalBase = 1
        for _ in 0..<digitIndex{
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
    }
}

746381295[0]

746381295[1]

746381295[2]




