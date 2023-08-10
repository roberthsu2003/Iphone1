//轉換程式流程方向
//continue
//break
//fallthrough
//return
//throw

//continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""

let charactersToRemove:[Character] = ["a","e","i","o","u"," "]

for character in puzzleInput{
    if charactersToRemove.contains(character){
        continue
    }
    puzzleOutput.append(character)
}

print(puzzleOutput)

