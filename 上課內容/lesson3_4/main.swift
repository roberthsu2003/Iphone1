let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1:String,_ s2:String) -> Bool{
	return s1 < s2
}
//使用function
var sortedNames = names.sorted(by: backward)
print(sortedNames)

//使用closure
var sortedNames1 = names.sorted(by:{
	(s1:String, s2:String) -> Bool in
	return s1 > s2
})

print(sortedNames1)

//使用closure
var sortedNames2 = names.sorted(by:{
	(s1, s2) in s1 > s2
})

print(sortedNames2)

//使用closure
var sortedNames3 = names.sorted(by:<)
print(sortedNames3)

//trailing Closure
var sortedNames4 = names.sorted{
	(s1:String, s2:String) -> Bool in
	return s1 > s2
}

print(sortedNames4)
