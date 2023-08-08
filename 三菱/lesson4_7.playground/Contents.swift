let someCharacter:Character = "c"
switch someCharacter{
case "a":
    print("a")
case "z":
    print("z")
default:
    print("其它字元")
}

let anotherCharacter:Character = "A"
switch anotherCharacter{
case "a","A":
    print("a")
case "z":
    print("z")
default:
    print("其它字元")
}
