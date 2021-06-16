//建立空的dictionary
var namesOfIntegers = [Int:String]()
namesOfIntegers[1] = "one"
namesOfIntegers[2] = "two"
namesOfIntegers[3] = "three"
namesOfIntegers[4] = "four"
namesOfIntegers
namesOfIntegers[2] = "twotwo"
namesOfIntegers

//透過純值建立dictionary
var airports = ["YYZ":"Toronto", "DUB":"Dublin"]
airports.count

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
//Dictionary取出的值，一定是optional type
var place = airports["yYZ"]

//解決的方法
//1.保證絕不會錯
//print(place!)

//2.使用if檢查
if place != nil{
    print(place!)
}else{
    print("錯誤，沒有這個key")
}


