import UIKit

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13, 17, 19, 23, 29],
    "Fibonacci": [1, 1, 2, 3, 5, 8, 13, 21, 34, 55],
    "Square": [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
]

var largets = 0
//tuple
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largets {
            largets = number
        }
    }
    
}

largets

var n = 2
while n < 100{
    n *= 2
}

print(n)

var m = 2
repeat {
    m *= 2
} while m < 100

print(m)

//範圍運算子
var total = 0
for i in 0..<4 {
    total += i
}

for index in 1...5{
    print(index)
}

let names = ["John", "Jane", "Jack", "Jill", "Jim", "Jenny", "John", "Jane", "Jack", "Jill", "Jim", "Jenny"]
let count = names.count
for index in 0..<count{
    let name = names[index]
}

for name in names[2...]{
    print(name)
}
print("==============================")
for name in names[...2]{
    print(name)
}


let meaningOfLife = 42
let pi = 3.14159
Double(meaningOfLife) + pi


42 + 3.14159

Double(meaningOfLife) + 3.14159

//型別的小名
typealias AudioSample = UInt16


let i = 1
if i == 1 {
    
}

let http404Error = (404, "Not Found")
//tuple 拆解法
let (statusCode, description) = http404Error


print(statusCode)
print(description)

http404Error.0
http404Error.1

let http200status = (statusCode:200, description:"ok")
http200status.statusCode
http200status.description
