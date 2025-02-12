import UIKit

struct FixedLengthRange{
    var firstValue: Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 10
//rangeOfThreeItems.length = 20

let rangeOfFourItems = rangeOfThreeItems
//rangeOfFourItems.firstValue = 20

//lazy stored Properties

class DataImporter{
     var filename = "data.txt"
}

class DataManager{
    lazy var importer = DataImporter()
    var data:[String] = []
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
manager.importer.filename


