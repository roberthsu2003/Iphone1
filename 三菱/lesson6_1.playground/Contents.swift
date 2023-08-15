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
