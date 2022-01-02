let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func back(_ s3:String,_ s4:String) -> Bool{
    return s3 < s4
}

names.sorted(by:back)

//標準closure
names.sorted(by: {
    (s1:String,s2:String) -> Bool in
    return s1 < s2
})

//簡化資料類型的closure
names.sorted(by: {
    s1,s2 in return s1 < s2
})

//trailing closure
names.sorted(){
   s1,s2 in
    return s1 < s2
}

