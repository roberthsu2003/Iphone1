//
//  ViewController.swift
//  lesson12_2
//
//  Created by 徐國堂 on 2024/1/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.view.backgroundColor!)
        //self.view.backgroundColor = nil
        self.view.backgroundColor = UIColor(red: CGFloat(217/255.0), green: CGFloat(224/255.0), blue: CGFloat(33/255.0), alpha: CGFloat(0.5))
        //self.view.backgroundColor = UIColor.secondaryLabel
        //self.view.backgroundColor = UIColor.systemIndigo
        let customColor = self.view.backgroundColor
        print(customColor!.cgColor.alpha)
    }


}

