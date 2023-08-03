var greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.indices{
    print("\(greeting[index])",terminator: "-")
}

//inserting and removing

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)

welcome.insert(contentsOf: " there", at: welcome.endIndex)
