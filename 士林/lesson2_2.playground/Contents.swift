import UIKit

var a = 1
a = a + 1
print(a)


var b = 123
b = b + 10
print(b)


//複合指定運算子
var c = 20
c += 10
print(c)

let contentHeight = 40
let hasHeader = true

if hasHeader{
    print(contentHeight + 50)
}else{
    print(contentHeight + 20)
}

print(contentHeight + (hasHeader ? 50 : 20))

var userDefineColorName:String?
//nil運算子
userDefineColorName ?? "red"

for index in 25...30{
    print(index)
}

for index in 25..<30{
    print(index)
}

let english = 100
let math = 100

//巢狀判斷
if english == 100{
    
    if math == 100{
        print(1000)
    }else{
        print(500)
    }
    
}else{
    
    if math == 100{
        print(500)
    }else{
        print(0)
    }
    
}

if english == 100 && math == 100{
    print(1000)
}else{
    if english == 100 || math == 100{
        print(500)
    }else{
        print(0)
    }
}

