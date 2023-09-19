//初始化完成後所有的store property 必需有值
struct Fahrenheit{
    var temperature:Double
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
print(f.temperature)

