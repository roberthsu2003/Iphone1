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
