class Vehicle{
    var numberOfWheel = 0 //store property
    var description:String{
        return "\(numberOfWheel)個輪子"
    } //computed property
}

let vehicle = Vehicle()
vehicle.description

class Bicycle:Vehicle{
    override init(){
        //step1:現讓自已所有的storeproperty有值
        //step2:super.init
        //step3:使用繼承來的store property和method
        super.init()
        numberOfWheel = 2
    }
}

let bicycle = Bicycle()
bicycle.description

class Hoverboard:Vehicle{
    var color:String
    init(color:String){
        self.color = color
        super.init()
    }
    
    override var description: String{
        return "\(super.description),顏色是\(color)"
    }
    
}


let hoverboard = Hoverboard(color: "silver")
hoverboard.description


