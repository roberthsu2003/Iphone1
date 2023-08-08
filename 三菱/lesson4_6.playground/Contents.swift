import UIKit
//單項選擇

var temperatureInFahrenheit = 30


 if temperatureInFahrenheit <= 32{
 print("非常冷")
 }
 
temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32{
    print("非常冷")
}else{
    print("不會非常冷")
}

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32{
    print("非常冷")
}else if temperatureInFahrenheit >= 86{
    print("溫暖")
}else{
    print("不會很冷")
}
