import UIKit

var greeting = "Hello, playground"
print(greeting)

//simple Value
var myVariable = 42
myVariable = 100
let myConstant = 42
//myConstant = 92

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

let label = "The width is "
let width = 94

let widthLable = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples and \(oranges) oranges."

let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit.
"""
print(quotation)

//Array
var fruits = ["strawberries", "bananas", "apples"]
fruits[0]


//Dictionary
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
    "Marie": "Doctor",
    "James": "Pilot"
]

var emptyArray:[String] = []
let emptyDictionary:[String:Float] = [:]

emptyArray.append("blueberries")
emptyArray = []








