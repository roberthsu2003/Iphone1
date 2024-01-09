//
//  ListContentViewController.swift
//  2lesson8_2
//
//  Created by 徐國堂 on 2024/1/9.
//

import UIKit

class ListContentViewController: UIViewController {
    @IBOutlet var stackView:UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ListContent選取"
        for pep in ["manny", "moe", "jack"]{
            var config = UIListContentConfiguration.cell()
            config.text = pep
            config.image = UIImage(named: pep)
            let listContentView = UIListContentView(configuration: config)
            stackView.addArrangedSubview(listContentView)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
