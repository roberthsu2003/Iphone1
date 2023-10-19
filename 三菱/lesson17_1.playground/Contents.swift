class Person{
    var residence:Residence?
}

class Residence{
    var numberOfRooms = 1
}

let john = Person()

if let roomCount = john.residence?.numberOfRooms{
    print(roomCount)
}else{
    print("執行失敗")
}

