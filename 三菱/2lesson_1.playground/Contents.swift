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

