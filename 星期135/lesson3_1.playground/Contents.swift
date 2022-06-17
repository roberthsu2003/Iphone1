import UIKit

let oddDigits:Set = [1, 3, 5, 7, 9]
let evenDigits:Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers:Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

//Dictionary
//建立空的dictionary
var namesOfIntegers:[Int:String] = [:]
namesOfIntegers[16] = "sixteen"
namesOfIntegers

//Dictionary
//使用符號建立Dictionary
var airports = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]
airports["YYZ"]
airports.count
airports.isEmpty
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
//透過key取出的值是optional的type

//使用optional binding檢查並取出值

if let airportName = airports["DUB"]{
    print(airportName)
}else{
    print("沒有這個key")
}

airports["APL"] = "Apple International"
airports["APL"] = nil
airports

//一個一個取出key和value
for (airportCode, airportName) in airports{
    print("\(airportCode):\(airportName)")
}

for airportCode in airports.keys{
    print(airportCode)
}

for airportName in airports.values{
    print(airportName)
}

let arr1 = [String](airports.keys)
arr1

