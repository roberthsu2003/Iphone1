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
