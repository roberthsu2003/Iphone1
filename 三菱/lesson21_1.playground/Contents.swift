extension Double{
    //擴充computed property
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
        return self/3.28084
    }
}

let double1 = 25.4
double1.mm

25.4.mm

3.0.ft

let aMarothon = 42.km + 195.m


struct Size{
    var width = 0.0, height = 0.0
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0,
                                        y: 2.0),
                          size: Size(width: 5.0,
                                     height: 5.0))
//擴充initializer

extension Rect{
    init(center:Point, size:Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin: Point(x: originX,
                                y: originY),
                  size: Size(width: size.width,
                             height: size.height))
    }
}

let centerRect = Rect(center: Point(x: 4.0,
                                    y: 4.0),
                      size: Size(width: 3.0,
                                 height: 3.0))
centerRect.origin.x
centerRect.origin.y
centerRect.size.width
centerRect.size.height


