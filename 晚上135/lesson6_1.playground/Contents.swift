//如果要定義字元，必需明確宣告
let someCharacter:Character = "A"
switch someCharacter{
case "a","A":
    print("是a或A")
case "z":
    print("是z")
default:
    print("其它")
}

//Interval Matching 數值範圍
let approximateCount = 150
switch approximateCount {
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
    print("其它")
}

//tuple比對
let somePoint = (0, 1)
switch somePoint{
case (0,0):
    print("中心點")
case (_,0):
    print("x軸")
case (0,_):
    print("y軸")
case (-2...2,-2...2):
    print("不在軸上")
default:
    print("超出範圍")
}

//value binding
let anotherPoint = (1, 2)
switch anotherPoint{
case (let x, 0):
    print("在x軸上,x是\(x)")
case (0, let y):
    print("在y軸上,y是\(y)")
case let (x,y):
    print("x是\(x),y是\(y)")
}

//value binding + where
let yetAnotherPoint = (3, 1)
switch yetAnotherPoint{
case let (x,y) where x==y:
    print("x=\(x),y=\(y),x==y")
case let (x,y) where x == -y:
    print("x=\(x),y=\(y),x==-y")
case let (x,y):
    print("x=\(x),y=\(y)")
}

if #available(iOS 10, macOS 10.12, *){
    print("版本10以上(包含10)")
}else{
    print("版本10以下")
}

