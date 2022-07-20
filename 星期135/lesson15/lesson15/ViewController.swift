//
//  ViewController.swift
//  lesson15
//
//  Created by 徐國堂 on 2022/7/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pickview:UIPickerView!
    
    var kindOfMembers = ["一般會員","銀會員","金會員","黑卡會員"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goMember"{
            print("我的會員申請的segue,被執行了")
            let index = pickview.selectedRow(inComponent: 0)
            let memberName = kindOfMembers[index]
            let memberViewController = segue.destination as! MemberViewController
            memberViewController.delegate = self
            memberViewController.kindOfMember = memberName
        }
        
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
    func pickerView(_ pickerView: UIPickerView,
                 titleForRow row: Int,
                    forComponent component: Int) -> String?{
        return kindOfMembers[row]
    }
}

extension ViewController:MemberViewControllerDelegate{
    func receiveNameAndAge(name:String, age:String){
        print("name=\(name)")
        print("age=\(age)")
        navigationController!.popViewController(animated: true)
    }
}

