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
        print("房間的數目是\(numberOfRooms)")
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
    
    func buildingIdentifier() -> String?{
        if let buildingNumber = buildingNumber,let street = street{
            return "\(buildingNumber) \(street)"
        }else if buildingName != nil{
            return buildingName
        }else{
            return nil
        }
    }
}

let john = Person()

if let roomCount = john.residence?.numberOfRooms{
    print(roomCount)
}else{
    print("失敗")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"


func createAddress() -> Address{
    print("function被執行")
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}

john.residence?.address = createAddress()

if john.residence?.printNumberOfRooms() != nil{
    print("function執行成功")
}else{
    print("function執行失敗")
}

if (john.residence?.address = someAddress) == nil{
    print("失敗")
}

if let firstRoomName = john.residence?[0].name{
    print(firstRoomName)
}else{
    print("房間名稱取得失敗")
}

if (john.residence?[0] = Room(name:"Bathroom")) == nil{
    print("給Room失敗")
}







