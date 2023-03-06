//
//  ViewController.swift
//  lesson8_3
//
//  Created by 徐國堂 on 2023/3/6.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myLabel:UILabel!
    @IBOutlet var button1:UIButton!
    @IBOutlet var button2:UIButton!
    @IBOutlet var button3:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "這是程式控制的文字"
        myLabel.textAlignment = NSTextAlignment.center
        //保證一定有值,使用force unwrapping
        //let button1_titleLabel = button1.titleLabel
        //button1_titleLabel!.text = "左開關"
        button1.setTitle("左開關", for: UIControl.State.normal)
        button1.addTarget(self, action: #selector(b1_action(_:)), for: UIControl.Event.touchUpInside)
         
        //使用optional binding 同時檢查,同時force unwrapping
        /*if let button2_titleLabel = button2.titleLabel{
            button2_titleLabel.text = "中間開關"
        }*/
        button2.setTitle("中間開關", for: UIControl.State.normal)
        button2.addTarget(self, action: #selector(b2_action(_:)), for: UIControl.Event.touchUpInside)
        
        //使用guard else
        /*
        guard let button3_titleLabel = button3.titleLabel else{
            return
        }
        button3_titleLabel.text = "右邊開關"
         */
        button3.setTitle("右邊開關", for: UIControl.State.normal)
        button3.addTarget(self, action: #selector(b3_action(_:)), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func b1_action(_ sender:UIButton){
        
        myLabel.text = "左按鈕被按了"
    }
    
    @objc func b2_action(_ sender:UIButton){
        myLabel.text = "中間按鈕被按了"
        
    }
    
    @objc func b3_action(_ sender:UIButton){
        myLabel.text = "右按鈕被按了"
    }


}

