//Debugging with Assertion

/*
 let age = -3
 //檢查age內的值
 assert(age >= 0, "age的值不正確")
 print(age)
 */

let age = -3
if age > 10{
    print(">10")
}else if age >= 0{
    print(">0 <10")
}else{
    assertionFailure("age的值不正確")
}

print(age)

