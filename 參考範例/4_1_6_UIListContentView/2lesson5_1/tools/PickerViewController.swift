//
//  PickerViewController.swift
//  2lesson5_2
//
//  Created by 徐國堂 on 2024/1/7.
//

import UIKit

class PickerViewController: UIViewController {
    @IBOutlet var picker:UIPickerView!
    var states = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let statesUrl = Bundle.main.url(forResource: "states", withExtension: "txt") else {return}
        guard let states_str = try? String.init(contentsOf: statesUrl) else {return}
        
        states = states_str.components(separatedBy: "\n")
        
        picker.dataSource = self
        picker.delegate = self
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
        states.count
    }
}

extension PickerViewController:UIPickerViewDelegate{
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String?{
        return states[row]
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ){
        print(states[row])
    }
}
