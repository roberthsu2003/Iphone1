let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

gameLoop: while square != finalSquare{
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    switch square + diceRoll{
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}

print("Game over")

//guard else,提早離開function
//解決判斷optional type 是否為nil
/*
func greet(person:[String:String]){
    if let name = person["name"]{
        print("Hello! \(name)")
        
        if let location = person["location"]{
            print("\(location)位置希望天氣很好")
        }else{
            return
        }
        
    }else{
        return
    }
}

greet(person: ["name":"Jane","location":"台北"])
*/
func greet1(person:[String:String]){
    guard let name = person["name"] else{
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else{
        return
    }
    print("\(location)位置希望天氣很好")
}

greet1(person: ["name":"Jane"])
greet1(person: ["name":"robert","location":"台北"])


