struct SomeStructure{
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty:Int{
            return 1
    }
}

SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty


class SomeClass{
    static var storedTypeProperty = "Some Value."
    class var overrideableComputedTypeProperty:Int{
        return 107
    }
}

SomeClass.storedTypeProperty
SomeClass.overrideableComputedTypeProperty
