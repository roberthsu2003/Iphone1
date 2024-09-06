let someCharacter:Character = "a"

switch someCharacter{
	case "a":
		print("a")
	case "z":
		print("z")
	default:
		print("other")
}

//group

switch someCharacter{
	case "a","z":
		print("a或z")
	default:
		print("other")
}

//範圍運算子

let approximateCount = 3
switch approximateCount{
	case 0:
		print("0")
	case 1..<5:
		print("1~4")
	case 5..<12:
		print("5~11")
	case 12..<100:
		print("12~99")
	case 100..<1000:
		print("100~999")
	default:
		print("1000~..")

}

//範圍運算子,tuple
let somePoint = (9, 7)

switch somePoint{
	case (0, 0):
	   print("0,0")
	
	case (_, 0):
		print("x axis")

	case (0,_):
	  print("y axis")

	case (-2...2,-2...2):
		print("在範圍內")

	default:
		print("超出範圍")
	
}
