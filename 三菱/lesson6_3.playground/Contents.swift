let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//names.sort()
//names.sorted()

func abc(_ s1:String,_ s2:String) -> Bool{
    return s1 > s2
}

names.sorted(by: abc)



