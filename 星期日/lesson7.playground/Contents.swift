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

//value binding
let anotherPoint = (2, 0)
switch anotherPoint{
case (0,0):
    print("在原點")
case (let x,0):
    print("在x軸上的\(x)")
case (0, let y):
    print("在y軸上的\(y)")
case let (x,y):
    print("x是:\(x),y是\(y)")
}

//optional binding

func greet(person:[String:String]){
    if let name = person["name"]{
        if let nickName = person["nickname"]{
            print("\(name),\(nickName)")
        }
    }else{
        print("沒有這個key")
        return
    }
    
}

//optional binding串接

func greet2(person:[String:String]){
    if let name = person["name"],let nickName = person["nickname"]{
        print("\(name),\(nickName)")
    }else{
        print("沒有這個key")
        return
    }
    
}

//提早離開
func greet1(person:[String:String]){
    guard let name = person["name"] else{
        print("沒有name這個key")
        return
    }
    
    guard let nickName = person["nickName"] else{
        print("沒有nickName這個key")
        return
    }
    
    print("\(name),\(nickName)")
    
}

//版本控制
if #available(iOS 10, macOS 10.12, *){
    //ios10,macOS10.12
}else{
    //ios10,macOS10.12
    
}


