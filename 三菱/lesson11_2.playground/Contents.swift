class SomeClass{
    class func someTypeMethod(){
        
    }
}

SomeClass.someTypeMethod()

struct LevelTracker{
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level:Int){
        if level > highestUnlockedLevel{
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level:Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    
    mutating func advance(to level:Int) -> Bool{
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}
