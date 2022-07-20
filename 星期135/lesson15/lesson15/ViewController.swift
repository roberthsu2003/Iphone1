//
//  ViewController.swift
//  lesson15
//
//  Created by 徐國堂 on 2022/7/20.
//

import UIKit

class ViewController: UIViewController {
    
    var kindOfMembers = ["一般會員","銀會員","金會員","黑卡會員"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    


}

extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int{
        return kindOfMembers.count
    }
}

extension ViewController:UIPickerViewDelegate{
    
}

