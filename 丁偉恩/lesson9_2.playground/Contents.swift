//Default Initializers
/*
class ShoppingListItem{
    var name:String?
    var quantity = 1
    var purcha=false
}

var item = ShoppingListItem()

struct Size{
    var width=0.0, height = 0.0
}

let s1 = Size()
let s2 = Size(width: 2.0, height: 2.0)
 */

//initializer 可以呼叫別的initializer
struct Size{
    var width=0.0, height=0.0
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var oright = Point()
    var size = Size()
    
    init(oright:Point,size:Size){
        self.oright = oright
        self.size = size
    }
    
    init(center:Point, size:Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(oright: Point(x: originX, y: originY), size: size)
    }
    
    init(){
        
    }
}

let basicRect = Rect()


