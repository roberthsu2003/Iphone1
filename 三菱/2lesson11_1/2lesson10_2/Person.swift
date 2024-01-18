//
//  Person.swift
//  2lesson10_2
//
//  Created by 徐國堂 on 2024/1/16.
//

import UIKit

class Person: NSObject,Codable{
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
    
    func encode(with encoder: NSCoder){
        encoder.encode(self.lastName, forKey: "last")
        encoder.encode(self.firstName, forKey: "first")
    }
    
    required init?(from decoder: NSCoder){
        self.lastName = decoder.decodeObject(of: NSString.self, forKey: "last")! as String
        self.firstName = decoder.decodeObject(of: NSString.self, forKey: "first")! as String
        super.init()
    }
    
}
