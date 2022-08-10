//
//  ViewController.swift
//  lesson20
//
//  Created by 徐國堂 on 2022/8/10.
//

import UIKit
import FlexColorPicker

class ViewController: DefaultColorPickerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }


}

extension ViewController:ColorPickerDelegate{
    func colorPicker(_ colorPicker: ColorPickerController, confirmedColor: UIColor, usingControl: ColorControl){
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        confirmedColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        print("r=\(r), g=\(g), b=\(b), a=\(a)")
    }
}

