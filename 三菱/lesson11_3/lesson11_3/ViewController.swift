//
//  ViewController.swift
//  lesson11_3
//
//  Created by 徐國堂 on 2023/9/5.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mint:UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        if let mint = self.mint{
            print("mint不是nil")
        }else{
            print("mint是nil")
        }
    }
    
    override func viewDidLoad() {
        //當storyboard 內的view,已經可以使用程式控制了
        super.viewDidLoad()
        print(#function)
        if let mint = self.mint{
            print("mint不是nil")
        }else{
            print("mint是nil")
        }
    }


}

