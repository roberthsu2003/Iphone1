//
//  ExpressionViewController.swift
//  delegate
//
//  Created by 徐國堂 on 2023/11/21.
//

import UIKit

protocol ExpressionViewControllerDelegate: AnyObject {
    func userSelected(shippingSelected:String)
}

class ExpressionViewController: UIViewController {
    weak var delegate: ExpressionViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate?.userSelected(shippingSelected: "ExpressionViewController傳出的")
    }

}
