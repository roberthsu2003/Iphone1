//系統版本判斷, if #
if #available(iOS 10, macOS 10.12, *){
    print("macOS10.12(包含)以上")
}else{
    print("macOS10.12以下")
}

@available(macOS 10.12, *)
struct ColorPreference{
    var bestColor = "blue"
}

func chooseBestColor() -> String{
    guard #available(macOS 10.12, *) else{
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}

print(chooseBestColor())

if #unavailable(iOS 10){
    
}
