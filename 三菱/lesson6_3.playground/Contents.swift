let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//names.sort()
//names.sorted()

func a1(_ s1:String,_ s2:String) -> Bool{
    return s1 > s2
}

names.sorted(by: a1)

//closure->暱名的function
names.sorted(by: {
    (s1:String,s2:String)->Bool in
    return s1 < s2
})



