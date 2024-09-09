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
