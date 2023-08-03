var greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
