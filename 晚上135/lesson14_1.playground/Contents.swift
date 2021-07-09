protocol SomeProtocol{
    //requirement
    var mustBeSettable:Int {get set}
    var doesNotNeedToBeSettable:Int {get}
}

struct SomeStructure:SomeProtocol{
    var mustBeSettable: Int
    var doesNotNeedToBeSettable: Int{
        return 50
    }
}
