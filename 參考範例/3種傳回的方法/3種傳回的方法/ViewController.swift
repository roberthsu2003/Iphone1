//
//  ViewController.swift
//  3種傳回的方法
//
//  Created by 徐國堂 on 2021/3/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FIRST"{
            let firstViewController = segue.destination as! FirstViewController
            firstViewController.delegate = self
        }else if segue.identifier == "SECOND"{
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.postBack={
                (name:String,password:String) in
                print(name)
                print(password)
            }
        }else if segue.identifier == "THIRD"{
            let thirdViewController = segue.destination as! ThirdViewController
            thirdViewController.postBack { (name:String, password:String) in
                print(name)
                print(password)
            }
        }
    }


}
extension ViewController:FirstViewControllerDelegate{
    func postBack(name:String,password:String){
        print(name)
        print(password)
    }
}

