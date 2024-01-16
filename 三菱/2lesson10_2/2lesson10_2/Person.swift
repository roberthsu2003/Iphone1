//
//  Person.swift
//  2lesson10_2
//
//  Created by 徐國堂 on 2024/1/16.
//

import UIKit

class Person: NSObject{
    var firstName:String
    var lastName:String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init()
    }
    override var description: String{
        return self.firstName + " " + self.lastName
    }
}
