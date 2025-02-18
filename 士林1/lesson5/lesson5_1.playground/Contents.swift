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

//type property
struct SomeStructure {
    nonisolated(unsafe) static var storedTypeProperty = 2
    static var computedTypeProperty:Int{
        return  storedTypeProperty * 2
    }
}

enum SomeEnumerate {
    nonisolated(unsafe) static var storedTypeProperty = 2
    static var computedTypeProperty:Int{
        return  storedTypeProperty * 2
    }
}

class SomeClass {
    nonisolated(unsafe) static var storedTypeProperty = 2
    static var computedTypeProperty:Int{
        return  storedTypeProperty * 2
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

SomeClass.overrideableComputedTypeProperty

struct AudioChannel{
    static let thresholdLevel = 10
    nonisolated(unsafe) static var maxInputLevelForAllChannels = 0
    
    var currentLevel:Int = 0{
        didSet {
            if currentLevel > AudioChannel.thresholdLevel{
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels{
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 15
AudioChannel.maxInputLevelForAllChannels







