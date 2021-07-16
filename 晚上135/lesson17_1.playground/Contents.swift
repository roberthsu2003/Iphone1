import UIKit

enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeds:Int)
    case outOfStock
}



func canThrowError(num:Int) throws -> String{
    if num == 10{
        throw VendingMachineError.insufficientFunds(coinsNeeds: 5)
    }
    
    return "有傳出字串"
}

//執行有丟出錯誤的方法有4種
//do..try..catch
//try?
//try!
//throw

if let stringValue = try? canThrowError(num: 10){
    print(stringValue)
}else{
    print("method 出錯")
}

let stringValue1 = try! canThrowError(num: 5)
print(stringValue1)

do{
    let stringValue = try canThrowError(num: 10)
    print(stringValue)
}catch VendingMachineError.insufficientFunds(let coinsNeeds){
    print("出錯了,少了\(coinsNeeds)")
}catch VendingMachineError.invalidSelection{
    print("不合法的選擇")
}catch{
    print("有其它錯誤")
}

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

movieCount=0
songCount=0

for item in library{
    if let _ = item as? Movie{
        movieCount += 1
    }else if let _ = item as? Song{
        songCount += 1
    }
}

movieCount
songCount

