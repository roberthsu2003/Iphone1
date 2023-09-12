//
//  ViewController.swift
//  test1
//
//  Created by 徐國堂 on 2023/9/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var heigtLabel:UILabel!
    @IBOutlet var heightField:UITextField!
    @IBOutlet var weightLabel:UILabel!
    @IBOutlet var weightField:UITextField!
    @IBOutlet var contentView:UIView!
    @IBOutlet var caculateButton:UIButton!
    
    var bmiLabel=UILabel()
    var labelConstraints = [NSLayoutConstraint]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightField.addTarget(self, action: #selector(hideBMI(_:)), for: .editingDidBegin)
        weightField.addTarget(self, action: #selector(hideBMI(_:)), for: .editingDidBegin)
        
        
    }
    
    @IBAction func userClick(_ sender:UIButton){
        heightField.endEditing(true)
        weightField.endEditing(true)
        displayBMI()
    }
    
    @objc func hideBMI(_ sender:Any){
        print("heightField begin Editing")
        if bmiLabel.isDescendant(of: view){
            print("Hide")
            bmiLabel.removeFromSuperview()
            view.removeConstraints(labelConstraints)
        }
    }
    
    
    func displayBMI(){
        bmiLabel.text = "Hello! World!"
        view.addSubview(bmiLabel)
        labelConstraints.append(NSLayoutConstraint(item: contentView ?? UIView(), attribute: .bottom, relatedBy: .equal, toItem: bmiLabel, attribute: .top, multiplier: 1, constant: -20))
        labelConstraints.append(NSLayoutConstraint(item: view!, attribute: .leading, relatedBy: .equal, toItem: bmiLabel, attribute: .leading, multiplier: 1, constant: -50))
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(labelConstraints)
        
    }


}

