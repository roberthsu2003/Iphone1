func greet(person:[String:String]){
    guard let name = person["name"] else{
        return
    }
}

if #available(iOS 10, macOS 10.13, *){
    print("iOS10以上,macOS 10.13")
}else{
    print("其它版本")
}
