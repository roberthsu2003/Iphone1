protocol Container{
    associatedtype Item:Equatable
    mutating func append(_ item:Item)
    var count:Int{get}
    subscript(i:Int)->Item{get}
}

struct IntStack:Container{
    var items:[Int] = []
    mutating func push(_ item:Int){
        items.append(item)
    }
    mutating func pop() -> Int{
        return items.removeLast()
    }
    
    typealias Item = Int
    mutating func append(_ item:Item){
        self.push(item)
    }
    var count:Int{
        return items.count
    }
    subscript(i:Int)->Item{
        return items[i]
    }
}

struct Stack<Element:Equatable>:Container{
    var items:[Element] = []
    mutating func push(_ item:Element){
        items.append(item)
    }
    mutating func pop() -> Element{
        return items.removeLast()
    }
    
    mutating func append(_ item:Element){
        self.push(item)
    }
    var count:Int{
        return items.count
    }
    subscript(i:Int)->Element{
        return items[i]
    }
}

extension Array:Container where Element:Equatable{}

