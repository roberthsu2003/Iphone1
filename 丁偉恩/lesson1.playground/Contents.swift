var i = 10 //推測
var j:Int = 20


var n:Float = 12.5 //明確宣告

Float(i) + n

//optional type
let possibleNumber = "123a"
if let convertedNumber = Int(possibleNumber){
    print(convertedNumber)
}else{
    print("轉換有誤")
}
/*
if convertedNumber == nil{
    print("轉換有誤")
}else{
    print(convertedNumber!)
}
 */

if let firstNumber = Int("4"){
    if let secondNumber = Int("42"){
        if firstNumber < secondNumber && secondNumber < 100{
            print("\(firstNumber)<\(secondNumber)<100")
        }
    }
}

if let firstNumber = Int("4"),let secondNumber = Int("42"),firstNumber < secondNumber && secondNumber < 100{
    print("\(firstNumber)<\(secondNumber)<100")
}

func greet(person:[String:String]){
    /*
    if let name = person["name"]{
        print(name)
        print("成功")
    }else{
        print("出錯了")
        return
    }
     */
    guard let name = person["name"] else{
        print("name出錯了")
        return
    }
    print("Hello! \(name)")
    
    guard let location = person["location"] else{
        print("location出錯了")
        return
    }
    
    print("name\(name), \(location)")
}

greet(person:["name":"John"])
greet(person:["name":"John","location":"Taipei"])


let defaultColorName = "red"
var userDefineColorName:String?

var colorNameToUse = userDefineColorName ?? defaultColorName
colorNameToUse

