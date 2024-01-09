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
        guard let state_url = Bundle.main.url(forResource: "states", withExtension: "txt") else{return}
        guard let state_str = try? String.init(contentsOf: state_url) else {return}
        states = state_str.components(separatedBy: "\n")
        print(states)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
