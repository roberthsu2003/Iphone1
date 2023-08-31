struct AudioChannel{
    static let thresholdLevel = 10
    static var maxInputLevelFolAllChannels = 0
    
    var currentLevel:Int = 0 {
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelFolAllChannels{
                AudioChannel.maxInputLevelFolAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
leftChannel.currentLevel
AudioChannel.maxInputLevelFolAllChannels

rightChannel.currentLevel = 11
rightChannel.currentLevel
AudioChannel.maxInputLevelFolAllChannels



