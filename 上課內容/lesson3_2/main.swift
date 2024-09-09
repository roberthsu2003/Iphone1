func greet(person:String) -> String{
	let greeting = "Hello, " + person + "!"
	return greeting
}


func greet(for person:String) -> String{
	let greeting = "Hello, " + person + "!"
	return greeting
}

print(greet(for: "Dave"))

func someFunction(firstParamenterName:Int, secondParamenterName:Int){
	
}

someFunction(firstParamenterName: 30, secondParamenterName: 2)

func someFunction(argumentLabel paramerterName:Int){
}

someFunction(argumentLabel: 8)

func greet(person:String, from hometown:String) -> String{
	return "Hello \(person)! Glad you could visit from \(hometown)."
}

print(greet(person: "Bill", from: "Cupertino"))


func someFunction(_ firstParamenterName:Int, secondParamenterName:Int){

}

someFunction(1, secondParamenterName: 87)

//參數的default value
func someFunction(p:Int,pWithDefault:Int=12){
}

someFunciton(p:10)
someFunction(p: 10, pWithDefault: 25)

