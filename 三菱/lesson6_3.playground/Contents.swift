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

//compiler可以透過別人定義的參數資料類型,來推測closure參數的資料類型
names.sorted(by: {
    s1,s2 in
    return s1 < s2
})

//function的程式區塊,只有1行,會自動return
names.sorted(by: {
    s1,s2 in s1 < s2
})

//compiler知道closure一定提供2個參數

names.sorted(by: { $0 < $1 })

//
names.sorted(by: <)

