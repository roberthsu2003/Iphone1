import UIKit

//if
var temperatureInFahrenheit: Double = 30

if temperatureInFahrenheit <= 32 { // 單項選擇
    print("現在非常涼しいです。")
}

temperatureInFahrenheit = 90

if temperatureInFahrenheit >= 86 { //雙項選擇
    print("現在非常熱")
} else {
    print("不熱")
}

if temperatureInFahrenheit <= 32{ //多項選擇
    print("非常冷しい")
}else if temperatureInFahrenheit >= 86{
    print("非常熱")
}else{
    print("非常暖かい")
}
