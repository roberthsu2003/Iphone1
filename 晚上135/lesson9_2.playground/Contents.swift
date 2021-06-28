struct FixedLengthRange{
    //store property
    var firstValue:Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//computed property
struct Student{
    let chinese:Int
    let english:Int
    let math:Int
    //computed property
    var sum:Int{
            return (chinese + english + math)
    }
}

let stu1 = Student(chinese: 78, english: 97, math: 65)
stu1.sum

struct Square{
    var side = 5.0
    
    //computed property
    var sum:Double{
        get{
            return side * 4
        }
        
        set(newSum){
            side = newSum / 4;
        }
    }
}

var square = Square()
square.sum
square.sum = 40
square.side


class Student1{
    var math = 0{
        willSet{
            print("現在傳進來的值是\(newValue)")
        }
        
        didSet{
            if math > 100{
                math = 100
            }else if math < 0{
                math = 0
            }
        }
    }
}

let stu2 = Student1();
stu2.math
stu2.math = 120
stu2.math
stu2.math = -10
stu2.math

