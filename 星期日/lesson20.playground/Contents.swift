class Person{
    var residence:Residence?
}

class Residence{
    var numberOfRooms = 1
}

let john = Person()
//let roomCount = john.residence!.numberOfRooms

//optional binding 檢查residence是不是nil
if let residence = john.residence{
    let roomCount = residence.numberOfRooms
}else{
    print("是nil")
}

//使用optional chaining 加 optional binding
if let roomCount = john.residence?.numberOfRooms{
    print(roomCount)
}else{
    print("是nil")
}
