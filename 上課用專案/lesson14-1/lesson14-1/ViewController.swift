//
//  ViewController.swift
//  lesson14-1
//
//  Created by 徐國堂 on 2021/1/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yellowClick(_ sender:UIBarButtonItem){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let yellowController = storyboard.instantiateViewController(withIdentifier: "yController") as? YellowViewController
        
        yellowController?.modalPresentationStyle = .fullScreen
        yellowController?.modalTransitionStyle = .coverVertical
        self.present(yellowController!, animated: true, completion: nil)
        
    }
    
    @IBAction func redClick(_ sender:UIBarButtonItem){
        let redViewController = RedViewController()
        redViewController.view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        redViewController.modalPresentationStyle = .formSheet
        redViewController.modalTransitionStyle = .coverVertical
        self.present(redViewController, animated: true, completion: nil)
    }


}

