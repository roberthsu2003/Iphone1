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
