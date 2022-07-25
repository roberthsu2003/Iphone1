//
//  PartViewController.swift
//  project14
//
//  Created by 徐國堂 on 2022/7/25.
//

import UIKit
protocol PartViewControllerDelegate:AnyObject{
    func popDown();
}

class PartViewController: UIViewController {
    
    weak var delegate:PartViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender:UIButton){
        if delegate != nil{
            delegate?.popDown()
        }
    }

}
