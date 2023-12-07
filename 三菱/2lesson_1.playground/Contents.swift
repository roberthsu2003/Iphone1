protocol Shape{
    func draw() -> String
}

struct Triangle:Shape{
    var size:Int
    func draw() -> String{
        var result:[String] = []
        for length in 1...size{
            result.append(String(repeating: "*", count: length))        }
        
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlippedShape<T:Shape>:Shape{
    var shape:T
    func draw() -> String{
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

let flippedTriangle = FlippedShape(shape: smallTriangle)
print("============")
print(flippedTriangle.draw())

struct JoinedShape<T:Shape, U:Shape>:Shape{
    var top:T
    var bottom:U
    func draw() -> String{
        return top.draw() + "\n" + bottom.draw()
    }
}

let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print("================")
print(joinedTriangles.draw())

func max<T>(_ x:T,_ y:T) -> T where T:Comparable{
    return x > y ? x : y
}

max(3, 5)
max("abc","efg")

struct Square:Shape{
    var size:Int
    func draw() -> String{
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape{
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
    return trapezoid
}

let trapezoid = makeTrapezoid()
trapezoid.draw()


func flip<T:Shape>(_ shape:T) -> some Shape{
    return FlippedShape(shape: shape)
}

func join<T:Shape, U:Shape>(_ top:T,_ bottom:U) -> some Shape{
    return JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())
/*
func invalidFlip<T:Shape>(_ shape:T) -> some Shape{
    if shape is Square{
        return shape
    }
    
    return FlippedShape(shape: shape)
}
 */

func protoFlip<T:Shape>(_ shape:T) -> Shape{
    
    if shape is Square{
        return shape
    }
     
    return FlippedShape(shape: shape)
}

let protoFlippedtriangle = protoFlip(smallTriangle)
let sameThing = protoFlip(smallTriangle)

protoFlippedtriangle == sameThing





