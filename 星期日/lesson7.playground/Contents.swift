let somePoint = (5,0)
switch somePoint{
case (0,0):
    print("在原點")
case (_,0):
    print("在x軸上")
case (0,_):
    print("在y軸上")
case (-2...2,-2...2):
    print("在範圍內")
default:
    print("在範圍外")
}
