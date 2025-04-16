class MediaItem{
    var name:String
    init(name:String){
        self.name = name
    }
}

class Movie:MediaItem{
    var director:String
    init(name:String,director:String){
        self.director = director
        super.init(name: name)
    }
}

class Song:MediaItem{
    var artist:String
    init(name:String,artist:String){
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "The Shawshank Redemption", director: "Frank Darabont"),
    Movie(name: "The Godfather", director: "Francis Ford Coppola"),
    Movie(name: "The Godfather: Part II", director: "Francis Ford Coppola"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    }else if item is Song{
        songCount += 1
    }
}

movieCount
songCount

for item in library {
    if let movie = item as? Movie{
        print("Movie\(movie.name) directed by \(movie.director)")
    }else if let song = item as? Song{
        print("Song \(song.name) by \(song.artist)")
    }
}
