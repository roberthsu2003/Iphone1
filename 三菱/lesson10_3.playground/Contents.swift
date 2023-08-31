struct SomeStructure{
    static var storedTypeProperty = "Some structure value."
    static var computedTypeProperty:Int{
        return 1
    }
}

enum someEnumeration{
    static var storedTypeProperty = "Some enumeration value."
    static var computedTypeProperty:Int{
        return 6
    }
}

class SomeClass{
    static var storedTypeProperty = "Some class value."
    static var computedTypeProperty:Int{
        return 27
    }
    class var overrideableComputedTypeProperty:Int{
        return 85
    }
}

SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty
someEnumeration.storedTypeProperty
someEnumeration.computedTypeProperty
SomeClass.storedTypeProperty
SomeClass.computedTypeProperty
SomeClass.overrideableComputedTypeProperty
