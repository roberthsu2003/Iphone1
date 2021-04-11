struct Point {
    var x=0.0, y=0.0
    
    mutating func moveBy(x deltaX:Double,y deltaY:Double){
        x += deltaX
        y += deltaY
    }
}
