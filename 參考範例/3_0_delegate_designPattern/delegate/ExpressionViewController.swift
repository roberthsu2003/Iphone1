//
//  ExpressionViewController.swift
//  delegate
//
//  Created by 徐國堂 on 2023/11/21.
//

import UIKit

protocol ExpressionViewControllerDelegate:AnyObject{
    func userSelected(shippingSelected:String)
}

class ExpressionViewController: UIViewController {
    @IBOutlet var expressButton:UIButton!
    weak var delegate:ExpressionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expressButton.showsMenuAsPrimaryAction = true
        //expressButton.changesSelectionAsPrimaryAction = true
        expressButton.setTitle("Shipping Speed", for: .normal)
        expressButton.menu = UIMenu(children: [
            UIAction(title: "Express Shipping", image: UIImage(systemName: "hare.fill"), handler: { [self] _ in
                delegate?.userSelected(shippingSelected: "Express Shipping")
                self.dismiss(animated: true)
            }),
            UIAction(title: "Standard Shipping", image: UIImage(systemName: "tortoise.fill"), handler: { [self] _ in
                delegate?.userSelected(shippingSelected: "Standard Shipping")
                self.dismiss(animated: true)
            }),
        ])
    }

}
