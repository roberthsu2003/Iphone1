func addTwoInts(_ a:Int,_ b:Int) -> Int{
    return a + b;
}


func multiplyTwoInts(_ a:Int, _ b:Int) -> Int{
    return a * b
}


var mathFunction:(Int,Int)->Int = addTwoInts

mathFunction(20, 30)
mathFunction = multiplyTwoInts
mathFunction(20, 30)


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
names.sorted()
names

func backward(_ s1:String,_ s2:String) -> Bool{
    return s1 > s2
}
//function當作引數的值
names.sorted(by: backward)

//closure
names.sorted(by: {
    (s1:String,s2:String)->Bool in
        return s1 < s2
})

