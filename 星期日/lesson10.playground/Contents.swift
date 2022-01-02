let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func back(_ s3:String,_ s4:String) -> Bool{
    return s3 < s4
}

names.sorted(by:back)

names.sorted(by: {
    (s1:String,s2:String) -> Bool in
    return s1 < s2
})
