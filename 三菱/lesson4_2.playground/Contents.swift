var namesOfIntegers:[Int:String] = [:]
var namesOfIntegers1 = [Int:String]()
var namesOfIntegers2 = Dictionary<Int, String>()

//新增元素
namesOfIntegers[16] = "sixteen"
namesOfIntegers
namesOfIntegers = [:]

//使用符號建立Dictionary
var airports:[String:String] = [
                                "YYZ":"Toronto pearson",
                                "DUB":"Dublin"
                                ]
print(airports)
airports.count
airports.isEmpty

//新增元素
airports["LHR"] = "London"
//更新
airports["LHR"] = "London Heathrow"
airports

//更新使用updataeValue
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("更新成功,原來的值是\(oldValue)")
}

//重要的,取出值傳出的是optional type
if let airportName = airports["DUB"]{
    print("DUB機場名稱\(airportName)")
}

airports["APL"] = "Apple International"
//刪除元素
airports["APL"] = nil
airports
