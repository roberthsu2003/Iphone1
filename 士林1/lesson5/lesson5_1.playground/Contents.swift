import UIKit

class StepCounter{
    var totalSteps:Int = 0{
        willSet(newTotalSteps){
            print("新增的值是\(newTotalSteps)")
        }
        
        didSet{
            if totalSteps > oldValue{
                print("增加\(totalSteps-oldValue)步")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 100

