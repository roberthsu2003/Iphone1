@propertyWrapper
struct TwelveOrLess{
    private var number = 0
    var wrappedValue:Int{
        get { return number }
        set { number = min(newValue, 12)}
    }
}

struct SmallRectangle{
    @TwelveOrLess var height:Int
    @TwelveOrLess var width:Int
}


var rectangle = SmallRectangle()
print(rectangle.height)
print(rectangle.width)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)


struct SmallRectangle1{
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    
    var height:Int{
        get { return _height.wrappedValue }
        set {_height.wrappedValue = newValue}
    }
    
    var width:Int{
        get {return _width.wrappedValue}
        set {_width.wrappedValue = newValue}
    }
    
}


