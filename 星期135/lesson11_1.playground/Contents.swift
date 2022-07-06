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
    Movie(name: "Casab", director: "Michael"),
    Song(name: "Blue", artist: "Elvis"),
    Movie(name: "Citizen", director: "Orson"),
    Song(name: "The One", artist: "Chesney"),
    Song(name: "Never", artist: "Rick")
]

var movieCount = 0
var songCount = 0

//使用is運算子,檢查實體型別
for item in library{
    if item is Movie{
        movieCount += 1
    }else if item is Song{
        songCount += 1
    }
}

movieCount
songCount
