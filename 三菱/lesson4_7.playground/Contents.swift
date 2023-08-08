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

//case後可以使用Range()
let approximateCount = 0
switch approximateCount{
case 0:
    print("0")
case 1..<5:
    print("1~4")
case 5..<12:
    print("5~11")
case 12..<100:
    print("12~99")
case 100..<1000:
    print("100~999")
default:
    print(">=1000")
}
