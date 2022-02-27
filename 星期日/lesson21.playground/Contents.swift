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
    Song(name: "Blue", artist: "Elvis"),
    Movie(name: "Citizen", director: "Orson"),
    Song(name: "The One And Only", artist: "Chesne"),
    Song(name: "Never Gonna", artist: "Rick Astley")
    
]

//檢查型別
// is 型別名稱

var movieCount = 0
var songCount = 0

for item in library{
    if item is Movie{
        movieCount += 1
    }else if item is Song{
        songCount += 1
    }
}

print("Media library 包含\(movieCount)影片,\(songCount)唱片")
