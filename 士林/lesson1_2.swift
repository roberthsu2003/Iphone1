print(Int8.max)
print(Int16.max)
print(Int32.max)
print(Int64.max)
print(Int8.min)
print(Int16.min)
print(Int32.min)
print(Int64.min)
print("================")
print(UInt8.max)
print(UInt16.max)
print(UInt32.max)
print(UInt64.max)
//純值運算
print("================")
print(3.14567 + 20)  //純值自動轉換型別

let PI = 3.14567 
print(PI + 20) //純值自動轉換型別

let num1 = 20
//print(PI + num1) //變數不會自動轉換型別
print(PI + Double(num1)) //強制轉換型別
print(Int(PI) + num1) //強制轉換型別
