struct SomeStructure{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty:Int{
        return 1
    }
}

SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty

enum SomeEnumeration{
    static var storedTypeProperty = "Enumerator value."
    static var computedTypeProperty:Int{
        return 6
    }
}

SomeEnumeration.storedTypeProperty
SomeEnumeration.computedTypeProperty

class SomeClass{
    static var storedTypeProperty = "class value."
    static var computedTypeProperty:Int{
        return 20
    }
    class var overrideableComputedTypeProperty:Int{
        return 107
    }
}

SomeClass.storedTypeProperty
SomeClass.computedTypeProperty
SomeClass.overrideableComputedTypeProperty
