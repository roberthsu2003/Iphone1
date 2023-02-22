let approximateCount = 888

switch approximateCount{
case 0:
    print("0")
case 1..<5:
    print("1~4")
case 5..<12:
    print("5~11")
case 12..<100:
    print("12~99")
case 100..<1000:
    print("100~999")
default:
    print("over 1000")
}

//tuple
let somePoint = (1, 1)
switch somePoint{
case (0,0):
    print("0,0")
case (_, 0):
    print("y軸")
case (0,_):
    print("x軸")
case (-2...2,-2...2):
    print("範圍內")
default:
    print("外面")
}

//value binding

let anotherPoint = (2, 0)
switch anotherPoint{
case (0,0):
    print("0,0")
case (let x,0):
    print("y軸上,x是\(x)")
case (0, let y):
    print("x軸上,y是\(y)")
case let(x,y):
    print("x=\(x),y=\(y)")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint{
case let(x,y) where x == y:
    print("x==y")
case let(x,y) where x == -y:
    print("x==-y")
case let(x,y):
    print("\(x),\(y)")
}

