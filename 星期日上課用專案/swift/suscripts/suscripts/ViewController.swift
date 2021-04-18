//
//  ViewController.swift
//  suscripts
//
//  Created by 徐國堂 on 2021/4/18.
//

import UIKit
struct TimesTable{
    let multiplier:Int
    subscript(index:Int) -> Int{
       return multiplier * index
    }
}

class ViewController: UIViewController {
    var numberOfLegs = [
        "spider":8,
        "ant": 6,
        "cat": 4
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        let threeTimesTable = TimesTable(multiplier: 3)
        print(threeTimesTable[5])
        print(numberOfLegs["spide"] ?? "沒有這個key")
    }


}

