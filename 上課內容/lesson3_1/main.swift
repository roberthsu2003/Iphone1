func greet(person:String) -> String{
	let greeting = "Hello, " + person + "!"
	return greeting
}

print(greet(person:"Anna"))
print(greet(person:"Robert"))

func greetAgain(person:String) -> String{
	return "Hello again, " + person + "!"
}

print(greetAgain(person:"Anna"))

//沒有參數的function
func sayHelloWorld() -> String{
	return "hello, world"
}

print(sayHelloWorld())

func greet(person:String, alreadyGreeted:Bool) -> String{
	if alreadyGreeted{
		return greetAgain(person: person)
	}else{
		return greet(person:person)
	}
}

print(greet(person: "Tim", alreadyGreeted: true))

func minMax(array:[Int]) -> (min:Int,max:Int){
	var currentMin = array[0]
	var currentMax = array[0]
	for value in array[1 ..< array.count]{
		if value < currentMin{
			currentMin = value
		}else if value > currentMax{
			currentMax = value
		}
	}

	return (currentMin, currentMax)	
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")


func minMax1(array:[Int]) -> (min:Int,max:Int)?{
	if array.isEmpty { return nil }
	var currentMin = array[0]
	var currentMax = array[0]
	for value in array[1 ..< array.count]{
		if value < currentMin{
			currentMin = value
		}else if value > currentMax{
			currentMax = value
		}
	}

	return (currentMin, currentMax)	
}
/*沒有檢查optional資料
let bounds1 = minMax1(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds1!.min) and max is \(bounds1!.max)")
*/
/* nil後面不可以是點運算子
let bounds2 = minMax1(array: [])
print("min is \(bounds2!.min) and max is \(bounds2!.max)")
*/

//optional binding
if let bounds1 = minMax1(array: [8, -6, 2, 109, 3, 71]){
	print("min is \(bounds1.min) and max is \(bounds1.max)")
}else{
	print("array是空的")
}


