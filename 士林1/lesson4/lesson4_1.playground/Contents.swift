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


