//store property
//let property的結構的實體,不可以更實體內的store property的值

struct FixedLengthRange{
    var firstValue:Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//rangeOfThreeItems.length = 8 #error

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
rangeOfFourItems.firstValue
rangeOfFourItems.length

//lazy store property
class DataImporter{
    var filename = "data.txt" //會花費3秒的時間
}

class DataManager{
    lazy var importer = DataImporter() //花費3秒的時間
    var data:[String] = []
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")
manager
manager.importer.filename
manager


