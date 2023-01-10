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

