import UIKit

let oddDigits:Set = [1, 3, 5, 7, 9]
let evenDigits:Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers:Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
