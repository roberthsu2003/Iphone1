//
//  ViewController.swift
//  delegate
//
//  Created by 徐國堂 on 2023/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var expressLable:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickNext(_ sender:UIBarButtonItem){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let expressionViewController = storyboard.instantiateViewController(withIdentifier: "expressionViewController") as! ExpressionViewController
        expressionViewController.delegate = self
        self.present(expressionViewController, animated: true)
    }


}

extension ViewController:ExpressionViewControllerDelegate{
    func userSelected(shippingSelected:String){
        expressLable.text = shippingSelected
    }
}

