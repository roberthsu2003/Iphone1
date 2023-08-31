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
