//store property
struct FixedLengthRange{
	var firstValue:Int
	let length:Int
}

//default initializer
//memberwise initializer

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
//rangeOfThreeItems.length = 9

//lazy Stored Property

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
print(manager.importer.filename)
