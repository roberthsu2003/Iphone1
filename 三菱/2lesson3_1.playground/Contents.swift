var x = 666
var y = 888

func swap<S:Equatable>(_ n:inout S,_ m:inout S){
    let temparary = n
    n = m
    m = temparary
}

swap(&x,&y)
print(x)
print(y)


var stepSize = 1
func increment(_ number:inout Int){
    number += stepSize
}
//記憶體衝突
//increment(&stepSize)
var copyOfStepSize = stepSize
increment(&copyOfStepSize)
stepSize = copyOfStepSize



