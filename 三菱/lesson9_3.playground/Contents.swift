//property observer
//可以觀察的property
//1.自訂的store property
//2.繼承而來的store property
//3.繼承而來的computed property

class StepCounter{
    var totalSteps:Int = 0 {
        willSet{
            print("目前傳進來的值是\(newValue)")
        }
        didSet{
            if totalSteps > oldValue{
                print("比原來的值,增加了\(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 150
stepCounter.totalSteps = 200

