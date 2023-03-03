let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
names.sorted(by: {
    (s1:String, s2:String) -> Bool in
    return s1 < s2
})

//依內容推測型別
names.sorted(by: {
    s1, s2  in
    return s1 < s2
})

//依內容只有一行,會自動return
names.sorted(by: {s1, s2  in s1 < s2})

//使用$0,$1取代參數名稱
names.sorted(by:<)

func someFunctionThatTakesAClosure(closure:() -> Void){
    
}

someFunctionThatTakesAClosure{
    print("Hello")
}

func someFunctionThatTakesAClosure1(s1:Int,closure:() -> Void){
    
}

someFunctionThatTakesAClosure1(s1:5){
    print("Hello")
}
