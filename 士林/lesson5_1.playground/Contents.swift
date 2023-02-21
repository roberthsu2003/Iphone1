import UIKit

//定義function
func greeting(person:String) -> String{
    return "Hello!\(person)"
}


greeting(person:"robert")
greeting(person:"alice")


func greeting(person:String,word:String) -> String{
    return "Hello!\(person),\(word)"
}

greeting(person: "robert", word: "nice to meet you")

//傳出多個值使用tuple
func minMax(array:[Int]) -> (min:Int,max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

let bounds =  minMax(array: [8, -6, 2, 109, 3, 71])

print("最小值是:\(bounds.min),最大值是\(bounds.max)")

func minMax1(array:[Int]) -> (min:Int,max:Int)?{
    if array.isEmpty{return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

if let bounds1 = minMax1(array: [8, -6, 2, 109, 3, 71]){
    print("最小值是:\(bounds1.min),最大值是\(bounds1.max)")
}else{
    print("您的陣列是空的")
}

if let bounds1 = minMax1(array:[Int]()){
    print("最小值是:\(bounds1.min),最大值是\(bounds1.max)")
}else{
    print("您的陣列是空的")
}
