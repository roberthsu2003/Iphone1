//while
//不明確知道執行的次數
let finalSquare = 25
var board = Array(repeating: 0, count: finalSquare + 1)
board[03] = +08;board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0;
var diceRoll = 0;

repeat{
    square += diceRoll
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    //diceRoll = Int.random(in: 1...6)
    square += diceRoll
    
}while square < finalSquare
print("Game over!")

