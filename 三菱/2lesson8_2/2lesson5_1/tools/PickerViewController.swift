//
//  PickerViewController.swift
//  2lesson8_2
//
//  Created by 徐國堂 on 2024/1/9.
//

import UIKit

class PickerViewController: UIViewController {
    @IBOutlet var picerView:UIPickerView!
    var states = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "美國50洲"
        guard let state_url = Bundle.main.url(forResource: "states", withExtension: "txt") else{return}
        guard let state_str = try? String.init(contentsOf: state_url) else {return}
        states = state_str.components(separatedBy: "\n")
        print(states)
        
        //使用代理人機制
        picerView.dataSource = self
        picerView.delegate = self
    }

}

extension PickerViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int{
        return 10
    }
}

extension PickerViewController:UIPickerViewDelegate{
    
}
