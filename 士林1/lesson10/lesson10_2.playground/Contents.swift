import UIKit

//optional chainning

class Person{
    var residence: Residence?
}

class Residence{
    var numberOfRooms = 1
    func tearDown(){
        print("method執行")
    }
}


let john = Person()

if let roomCount = john.residence?.numberOfRooms{
    print("john has \(roomCount) rooms")
}else{
    print("unable to determine")
}

/*
john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms{
    print("john has \(roomCount) rooms")
}else{
    print("unable to determine")
}
*/

if (john.residence?.numberOfRooms = 2) != nil{
    print("成功")
}else{
    print("失敗")
}

if john.residence?.tearDown() == nil{
    print("失敗")
}



    



