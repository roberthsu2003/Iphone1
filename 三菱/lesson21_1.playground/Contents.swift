extension Double{
    //擴充computed property
    var km:Double{
        return self * 1_000.0
    }
    
    var m:Double{
        return self
    }
    
    var cm:Double{
        return self / 100.0
    }
    
    var mm:Double{
        return self / 1_000.0
    }
    
    var ft:Double{
        return self/3.28084
    }
}

let double1 = 25.4
double1.mm

25.4.mm

3.0.ft

let aMarothon = 42.km + 195.m
