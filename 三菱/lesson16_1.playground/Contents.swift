let wholeNumber:Double = 12345.0
let pi = 3.14159

//optional binding
if let valueMaintained = Int(exactly: wholeNumber){
    print("\(wholeNumber) 可以完全轉換為整數\(valueMaintained)")
}

let valueChanged = Int(exactly: pi)
if valueChanged == nil{
    print("\(pi)無法完全轉換為整數")
}

//自訂init?
struct Animal{
    let species:String
    init?(species:String){
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

//optional binding
if let giraffe = someCreature{
    print("動物的種類是\(giraffe.species)")
}

let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
    print("沒有種類名稱不可以初始化")
}

enum TemperatureUnit{
    case Kelvin, celsius, fahrenheit
    init?(symbol:Character){
        switch symbol{
        case "K":
            self = .Kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
        
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil{
    print("溫度單位定義成功")
}

let unknowUnit = TemperatureUnit(symbol: "X")
if unknowUnit == nil{
    print("沒有的溫度單位,初始化失敗")
}

class Product{
    let name:String
    init?(name:String){
        if name.isEmpty {return nil}
        self.name = name
    }
}

class CartItem:Product{
    let quantity:Int
    init?(name:String, quantity:Int){
        if quantity < 1 {return nil}
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2){
    print("Item:\(twoSocks.name), quantity:\(twoSocks.quantity)")
}

class Document{
    var name:String?
    init(){}
    init?(name:String){
        if name.isEmpty {return nil}
        self.name = name
    }
}

class AutomaticallyNamedDocument:Document{
    override init(){
        super.init()
        self.name = "[untitled]"
    }
    
    override init(name:String){
        super.init()
        if name.isEmpty{
            self.name = "[untitled]"
        }else{
            self.name = name
        }
    }
}

class SomeClass{
    required init(){
        
    }
}

class SomeSubClass:SomeClass{
    required init(){
        
    }
}

//設定default value 使用closure

class SomeClass1{
    let someProperty:Int = {
        var a = 10
        a += 20
        return a
    }()
}

struct Chessboard{
    let boardColors:[Bool] = {
        print("執行")
        var temporaryBoard:[Bool] = []
        var isBlack = false
        for i in 1...8{
            for j in 1...8{
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row:Int, column:Int) -> Bool{
        return boardColors[(row*8) + column]
    }
    
}

let board = Chessboard()

print(board.boardColors)
print(board.boardColors)
print(board.boardColors)



