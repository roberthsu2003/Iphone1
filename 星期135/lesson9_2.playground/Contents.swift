import UIKit
class Person{
    var residence:Residence?
}

class Residence{
    var rooms:[Room] = []
    var numberOfRooms:Int{
        return rooms.count
    }
    
    subscript(i:Int) -> Room{
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms(){
        print("房間數量是\(numberOfRooms)")
    }
    
    var address:Address?
    
}

class Room{
    let name:String
    init(name:String){
        self.name = name
    }
}

class Address{
    var buildingName:String?
    var buildingNumber:String?
    var street:String?
}

let john = Person()

if let roomCount = john.residence?.numberOfRooms{
    print(roomCount)
}else{
    print("取得失敗")
}
