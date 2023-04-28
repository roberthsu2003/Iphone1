//computed properties
extension Double{
    var km:Double{return self * 1_000.0}
    var m:Double{return self}
    var cm:Double{return self / 100.0}
    var mm:Double{return self / 1_000.0}
    var ft:Double{return self / 3.28084}
}

let oneInch = 25.4.mm

//initializer

struct Size{
    var width=0.0, height=0.0;
}

struct Point{
    var x=0.0, y=0.0;
}


struct Rect{
    var origin = Point()
    var size = Size()
}

extension Rect{
    init(center:Point, size:Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

Rect(center: Point(x: 10, y: 10), size: Size(width: 20, height: 10))

//method



