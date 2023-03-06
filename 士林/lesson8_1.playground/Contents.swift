struct SomeStructure{
    static var stroedTypeProperty = "Some value."
    static var computedTypeProperty:Int{
        return 1
    }
}

SomeStructure.stroedTypeProperty
SomeStructure.computedTypeProperty


enum SomeEnumeration{
    static var stroedTypeProperty = "Some value."
    static var computedTypeProperty:Int{
        return 1
    }
}

SomeEnumeration.stroedTypeProperty
SomeStructure.computedTypeProperty


class SomeClass{
    static var stroedTypeProperty = "Some value."
    static var computedTypeProperty:Int{
        return 27
    }
    
    class var overrideableComputedTypeProperty:Int{
        return 107
    }
}

SomeClass.stroedTypeProperty
SomeClass.computedTypeProperty
SomeClass.overrideableComputedTypeProperty
