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

//擴充Int的實體方法
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

extension Int{
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()

//擴充subscripts
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

//擴充巢狀型別
extension Int{
    enum Kind{
        case negative, zero, positive
    }
    
    var kind:Kind{
        switch self{
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers:[Int]){
    for number in numbers{
        switch number.kind{
        case .negative:
            print("- ",terminator: "")
        case .zero:
            print("0 ",terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
