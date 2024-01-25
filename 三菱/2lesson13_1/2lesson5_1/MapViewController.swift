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
        navigationBar.tintColor = .lightGray
        navigationBar.prefersLargeTitles = true
        //建立bar的外觀
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.backgroundColor = .darkGray
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor:UIColor.white]
        navBarAppearance.backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        //navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        
        
        
    }
    


}
