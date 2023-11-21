//
//  ShippingViewController.swift
//  lesson22_3
//
//  Created by 徐國堂 on 2023/11/21.
//

import UIKit

class ShippingViewController: UIViewController {
    @IBOutlet var shippingButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shippingButton.showsMenuAsPrimaryAction = true
        shippingButton.menu = UIMenu(children: [
            UIAction(title: "Express Shipping", image: UIImage(systemName: "hare.fill"), handler: { [self] _ in
                print("Express Shipping")
                dismiss(animated: true)
            }),
            UIAction(title: "Standard Shipping", image: UIImage(systemName: "tortoise.fill"), handler: { [self] _ in
                print("Standards Shipping")
                dismiss(animated: true)
            }),
        ])
    }
    

}
