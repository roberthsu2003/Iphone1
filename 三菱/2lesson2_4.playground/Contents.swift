import UIKit

class Department{
    var name:String
    var courses:[Course]
    init(name:String){
        self.name = name
        self.courses = []
    }
    deinit{
        print("department釋放")
    }
}

class Course{
    
    var name:String
    unowned var department:Department
    unowned var nextCourse:Course?
    init(name:String, in department:Department){
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
    deinit{
        print("\(name)釋放")
    }
}

var department:Department? = Department(name: "Horticulture")

let intro = Course(name: "Survey of Plants", in: department!)
let intermediate = Course(name: "Growing Common Herbs", in: department!)
let advanced = Course(name: "Caring for Tropical Plants", in: department!)

intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department!.courses = [intro, intermediate, advanced]

department = nil
