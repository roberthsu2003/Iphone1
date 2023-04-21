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

movieCount
songCount

if let item1 = library[0] as? Movie{
    print("item\(item1.director)")
}

if let item1 = library[0] as? Song{
    print("item\(item1.artist)")
}else{
    print("轉型不成功")
}

for item in library{
    if let movie = item as? Movie{
        print("item:\(movie.director)")
    }else if let song = item as? Song{
        print("item:\(song.artist)")
    }
}



    
