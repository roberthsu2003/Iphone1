//collection Type
//明確宣告Array
//建立空的array
var someInts:[Int] = []
//var someInts:Array<Int> = []

print("someInts的元素數量\(someInts.count)")

//append()實體方法
someInts.append(3)

//全部清空
someInts = []

//建立Array,同時有預設的元素值
var threeDoubles = Array(repeating: 0.0, count: 3)
threeDoubles

var anotherThreeDouble = Array(repeating: 2.5, count: 3)
anotherThreeDouble

var sixDouble = threeDoubles + anotherThreeDouble
sixDouble
