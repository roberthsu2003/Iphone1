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


