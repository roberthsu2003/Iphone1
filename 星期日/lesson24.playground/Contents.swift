import Foundation
//擴充computed property
extension Double{
    var km:Double{
        return self * 1_000;
    }
    
    var m:Double{
        return self
    }
    
    var cm:Double{
        return self / 100
    }
    
    var mm:Double{
        return self/1000
    }
    
    var ft:Double{
        return self / 3.28084
    }
}

let oneInch = 25.4.mm
print("一英吋等於\(oneInch)公尺")

let threeFeet = 3.0.ft
print("3英尺等於\(threeFeet)公尺")

//擴充init
struct Size{
    var width=0.0, height=0.0
}

struct Point{
    var x=0.0, y=0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
}
//擴充init
extension Rect{
    init(center:Point, size:Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

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
