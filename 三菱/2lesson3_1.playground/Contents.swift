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
