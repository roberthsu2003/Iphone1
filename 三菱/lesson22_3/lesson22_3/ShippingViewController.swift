//
//  ShippingViewController.swift
//  lesson22_3
//
//  Created by 徐國堂 on 2023/11/21.
//

import UIKit

protocol ShippingViewControllerDelegate:AnyObject{
    func userSelected(shipping:String)
}

class ShippingViewController: UIViewController {
    @IBOutlet var shippingButton:UIButton!
    weak var delegate:ShippingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shippingButton.showsMenuAsPrimaryAction = true
        shippingButton.menu = UIMenu(children: [
            UIAction(title: "Express Shipping", image: UIImage(systemName: "hare.fill"), handler: { [self] _ in
                delegate?.userSelected(shipping: "Express Shipping")
                dismiss(animated: true)
            }),
            UIAction(title: "Standard Shipping", image: UIImage(systemName: "tortoise.fill"), handler: { [self] _ in
                delegate?.userSelected(shipping: "Standard Shipping")
                dismiss(animated: true)
            }),
        ])
    }
    

}
