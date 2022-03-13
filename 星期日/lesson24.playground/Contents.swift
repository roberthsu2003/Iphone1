import Foundation
extension Double{
    var km:Double{
        return self * 1_000;
    }
    
    var m:Double{
        return self
    }
    
    var cm:Double{
        return self / 100
    }
    
    var mm:Double{
        return self/1000
    }
    
    var ft:Double{
        return self / 3.28084
    }
}

let oneInch = 25.4.mm
print("一英吋等於\(oneInch)公尺")

let threeFeet = 3.0.ft
print("3英尺等於\(threeFeet)公尺")
