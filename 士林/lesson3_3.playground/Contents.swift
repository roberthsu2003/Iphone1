//建立空的Dictionary

var namesOfIntegers:[Int:String] = [:] //明確宣告
namesOfIntegers[16] = "sixteen"
namesOfIntegers

namesOfIntegers = [:]
namesOfIntegers

//純值建立Dictionary
/*
 var airports:[String:String] = [
 "YYZ":"Toronto Pearson",
 "DUB":"Dublin"
 ]
*/

var airports = [
"YYZ":"Toronto Pearson",
"DUB":"Dublin"
]
airports.count
//新增
airports["LHR"] = "London"
airports
//修改
airports["LHR"] = "London Heathrow"
airports

//updateValue()修改內容

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("舊的值是\(oldValue)")
}else{
    print("修改錯誤")
}

//Dictionary透過key取出值,一定是傳出optional type

if let airportName = airports["dUB"]{
    print("取出的值是\(airportName)")
}else{
    print("沒有這個key")
}

for (key,value) in airports{
    print("key是\(key),value是\(value)")
}

for key in airports.keys{
    print(key)
}

for value in airports.values{
    print(value)
}


