//
//  ViewController.swift
//  lesson22_3
//
//  Created by 徐國堂 on 2023/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var shippingLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userNext(_ sender:UIBarButtonItem){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let shippingViewController = storyboard.instantiateViewController(withIdentifier: "shippingViewController") as! ShippingViewController
        shippingViewController.delegate = self
        self.present(shippingViewController, animated: true)
    }
    
    
}

extension ViewController:ShippingViewControllerDelegate{
    func userSelected(shipping:String){
        shippingLabel.text = shipping
    }
}

