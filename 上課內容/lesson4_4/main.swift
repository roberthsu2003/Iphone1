struct SomeStructure{
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty:Int{
		return 20
	}
}

print(SomeStructure.storedTypeProperty)
print(SomeStructure.computedTypeProperty)

enum SomeEnumeration{
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty:Int{
		return 19
	}
}

print(SomeEnumeration.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)

class SomeClass{
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty:Int{
		return 19
	}

	class var overrideableComputedTypeProperty:Int{
		return 107
	}
}

print(SomeClass.storedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.overrideableComputedTypeProperty)
