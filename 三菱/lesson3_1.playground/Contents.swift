let someString = "Some string literal value"
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop.
"""
print(quotation)

let wiseWords = "\" Imagination is more\""
print(wiseWords)
let dollarSign = "\u{24}"
let balckHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

//空字串
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("字串是空的")
}

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and carriage"

//String Ares Value Type
var variableString1 = variableString
variableString1 += "."
variableString1
variableString

for character in "Dog!"{
    print(character)
}

let exclamationMark:Character = "!"
exclamationMark

let setCharacters:[Character] = ["C", "a", "t", "!"]

let catString = String(setCharacters)
catString
