import UIKit

class Person{
    var residence:Residence?
}

class Residence{
    var numberOfRooms = 1
}

let john = Person()
//let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms{
    print("房間數是\(roomCount)")
}else{
    print("沒有numberOfRooms")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms{
    print("房間數是\(roomCount)")
}else{
    print("沒有numberOfRooms")
}



