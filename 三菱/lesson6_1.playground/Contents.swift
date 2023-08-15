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

//function的程式區塊內,只有1行,會自動return
func greeting(for person:String) -> String{
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))

func anotherGreeting(for person:String) ->String{
     "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))

//如果只有定義參數名稱,則引數名稱和參數名稱是相同的名稱
func someFunction(firstParameterName:Int, secondParameterName:Int){
    
}
someFunction(firstParameterName: 1, secondParameterName: 1)

//前面引數名稱,後面的叫參數名稱
func someFunction(argumentLabel parameterName:Int){
    
}
someFunction(argumentLabel: 3)

//混合式
func greet(person:String,from hometown:String) -> String{
    return "\(person),您從\(hometown)來的"
}

greet(person: "Bill", from: "新北市")

//省略引數名稱
func someFunction(_ firstParameterName:Int, secondParameterName:Int){
}
someFunction(1, secondParameterName: 2)






