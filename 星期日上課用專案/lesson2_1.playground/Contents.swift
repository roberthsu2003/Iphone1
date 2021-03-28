struct FixedLengthRange{
    //實體store property
    var firstValue:Int
    let length:Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 10, length: 20)
var rangeOfThreeItems1 = FixedLengthRange(firstValue: 100, length: 200)
print(rangeOfThreeItems.firstValue)
print(rangeOfThreeItems1.firstValue)
rangeOfThreeItems.firstValue = 30
//rangeOfThreeItems.length = 40
