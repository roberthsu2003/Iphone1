let approximateCount = 12

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
    break
}


let somePoint = (0, 0)
//tuple matching
switch somePoint{
case (0,0):
    print("中心點")
case (_,0):
    print("x軸上")
case (0,_):
    print("y軸上")
case (-2...2,-2...2):
    print("在範圍內")
default:
    print("在範圍外")
}
