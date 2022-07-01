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

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia road"

//john.residence?.address = someAddress
if (john.residence?.address = someAddress) != nil{
    print("給address成功")
}else{
    print("給address失敗")
}

if john.residence?.printNumberOfRooms() != nil{
    print("呼叫method成功")
}else{
    print("呼叫method失敗")
}
