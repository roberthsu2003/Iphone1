/*
struct Fahrenheit{
    var temperature:Double
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
f.temperature
 */

//default Property Value
struct Fahrenheit{
    var temperature = 32.0
    //closure 的執行
    var temp1:Int = {
        return 32
    }()
}
