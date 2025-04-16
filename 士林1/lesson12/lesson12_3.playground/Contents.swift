import UIKit
//擴充computed property


extension Double{
    var km:Double{
        return self * 1000
    }
    
    var m:Double{
        return self
    }
    
    var cm:Double{
        return self / 100.0
    }
    
    var mm:Double{
        return self / 1000.0
    }
    
    var ft:Double{
        return self / 3.28084
    }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) mm")

//initializer

struct Size{
    var width:Double = 0.0
    var height:Double = 0.0
}

struct Point{
    var x:Double = 0.0
    var y:Double = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
}

extension Rect{
    init (center:Point, size:Size){
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

//method
extension Int{
    func repetitions(task:()->Void){
        for _ in 0..<self{
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}
