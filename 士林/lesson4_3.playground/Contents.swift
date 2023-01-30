

if #available(iOS 10, macOS 10.13, *){
    print("iOS10以上,macOS 10.13")
}else{
    print("其它版本")
}
//自訂function
func greet(person:String) -> String{
    let greet = "\(person)您好"
    return greet
}

greet(person: "robert")
greet(person: "alice")
greet(person: "jenny")

//自訂function
func add(one:Int, two:Int) -> Int{
    return one + two
}

add(one: 10, two: 50)
add(one: 35, two: 97)

