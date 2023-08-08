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




