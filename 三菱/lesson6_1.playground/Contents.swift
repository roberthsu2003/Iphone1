//function傳出多個值

func minMax(array:[Int]) -> (min:Int,max:Int){
    //定義function,要使用參數名稱
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

//呼叫時使用引數名稱
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("最小值是\(bounds.min),最大值是\(bounds.max)")

//function傳出optional type
func minMax(array1:[Int]) -> (min:Int,max:Int)?{
    //定義function,要使用參數名稱
    if array1.isEmpty{return nil}
    var currentMin = array1[0]
    var currentMax = array1[0]
    for value in array1[1..<array1.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

//呼叫時使用optional binding
if let bounds1 = minMax(array1: [8, -6, 2, 109, 3, 71]){
    print("最小值是\(bounds1.min),最大值是\(bounds1.max)")
}


