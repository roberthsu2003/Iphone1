var letters = Set<Character>()
letters.count
letters.insert("a")
letters
letters = []

//使用Array純值表示法建立Set
//必需明確宣告
//var favoriteGenres:Set<String> = ["Rock", "Classical", "Hip hop"]

var favoriteGenres:Set = ["Rock", "Classical", "Hip hop"]

//存取和修改set
favoriteGenres.isEmpty
//插入
favoriteGenres.insert("Jazz")
favoriteGenres.insert("Jazz")
favoriteGenres
//移除

if let removedGenre = favoriteGenres.remove("Rock"){
    print(removedGenre)
    
}

//檢查元素
favoriteGenres.contains("Funk")

//set iterating
for genre in favoriteGenres{
    print("\(genre)")
}

//set的集合運算
let oddDigits:Set = [1, 3, 5, 7, 9]
let evenDigits:Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers = [2, 3, 5, 7]

//set可以行容易轉換為array
//聯集
oddDigits.union(evenDigits).sorted()

//交集
oddDigits.intersection(evenDigits).sorted()

//差集
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]


houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)





