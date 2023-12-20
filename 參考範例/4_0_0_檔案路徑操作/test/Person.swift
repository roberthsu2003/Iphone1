//
//  Person.swift
//  test
//
//  Created by 徐國堂 on 2023/12/20.
//

import UIKit

class Person:NSObject, NSSecureCoding,Codable{ //因為要用property list encoder必需採納Codable
    static var supportsSecureCoding: Bool {return true}
    var firstName:String
    var lastName:String
    
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.lastName, forKey: "last")
        coder.encode(self.firstName, forKey: "first")
    }
    
    required init?(coder: NSCoder) {
        self.lastName = coder.decodeObject(of: NSString.self, forKey: "last")! as String
        self.firstName = coder.decodeObject(of: NSString.self, forKey: "first")! as String
        //do not call super init(coder:) in this case
        super.init()
    }
    
    
}
