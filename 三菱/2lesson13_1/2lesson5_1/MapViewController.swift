//
//  MapViewController.swift
//  2lesson13_1
//
//  Created by 徐國堂 on 2024/1/25.
//

import UIKit

class MapViewController: UIViewController {
    
    var city:City!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.city
        let navigationBar = self.navigationController!.navigationBar
        navigationBar.prefersLargeTitles = true    
        
    }
    


}
