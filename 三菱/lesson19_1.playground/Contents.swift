class MediaItem{
    var name:String
    init(name:String){
        self.name = name
    }
}

class Movie:MediaItem{
    var director:String
    init(name:String, director:String){
        self.director = director
        super.init(name: name)
    }
}

class Song:MediaItem{
    var artist:String
    init(name:String, artist:String){
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0

for item in library{
    if item is Movie{
        movieCount += 1
    }else if item is Song{
        songCount += 1
    }
}


for item in library{
    if let movie = item as? Movie{ //向下轉型
        print("name是\(movie.name),導演是\(movie.director)")
    }else if let song = item as? Song{
        print("name是\(song.name),作曲是\(song.artist)")
    }
    
}

var things:[Any] = []
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("Hello")
things.append((3.0, 5.0))
things.append(Movie(name: "GH", director: "Ivan"))
things.append({(name:String)->String in "Hello, \(name)"})

for thing in things{
    switch thing{
    case 0 as Int:
        print("0是整數")
    case 0 as Double:
        print("0是double")
    case let someInt as Int:
        print(someInt)
    case let someDouble as Double where someDouble>0:
        print("正數值")
    case let someString as String:
        print(someString)
    case let (x,y) as (Double, Double):
        print("x=\(x),y=\(y)")
    case let movie as Movie:
        print("\(movie.name)")
    case let stringConverter as (String) -> String:
        print(stringConverter("robert"))
    default:
        print("例外資料")
    }
}
