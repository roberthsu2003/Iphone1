//建立空的Set

var letter = Set<Character>()
letter.insert("a")
letter

letter = []
letter

//var favoriteGenres:Set<String> = ["Rock", "Classical", "Hip hop"]

//var favoriteGenres:Set = ["Rock", "Classical", "Hip hop"]

var numbers_set:Set = [1,2,2,3,3,4,5,6,7,8,9,10]

//元素數量
numbers_set.count

var favoriteGenres:Set = ["Rock", "Classical", "Hip hop"]
favoriteGenres.insert("Jazz")

//optional binding,檢查有沒有移除成功
if let removedGenre = favoriteGenres.remove("Rock"){
    print("移除是\(removedGenre)")
}else{
    print("移除失敗")
}

//取出set內所有的元素
for item in favoriteGenres{
    print(item)
}

//排序
print("============")
for item in favoriteGenres.sorted(){
    print(item)
}

//set 和  set 的運算

let oddDigits:Set = [1, 3, 5, 7, 9]
let evenDigits:Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers:Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()  //聯集

oddDigits.intersection(evenDigits).sorted() //交集

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()  //差集

oddDigits.subtracting(singleDigitPrimeNumbers).sorted() //減



