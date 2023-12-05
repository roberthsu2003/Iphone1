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

protocol SuffixableContainer:Container{
    associatedtype Suffix:SuffixableContainer where Suffix.Item == Item
    func suffix(_ size:Int) -> Suffix
}

extension Stack:SuffixableContainer{
    func suffix(_ size:Int) ->Stack{
        var result = Stack()
        for index in (count-size)..<count{
            result.append(self[index])
        }
        return result
        
    }
}

var stackOfInts = Stack<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)

let suffix = stackOfInts.suffix(2)
print(suffix)

//generic function, where做限定Item的型別
func allItemsMatch<C1:Container,C2:Container>(_ someContainer:C1,_ anotherContainer:C2) -> Bool where C1.Item == C2.Item, C1.Item:Equatable{
    if someContainer.count != anotherContainer.count{
        return false
    }
    for i in 0..<someContainer.count{
        if someContainer[i] != anotherContainer[i]{
            return false
        }
    }
    return true
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfString = ["uno", "dos", "tres"]


if allItemsMatch(stackOfStrings, arrayOfString){
    print("全部相同")
}else{
    print("沒有全相同")
}

