//
//  MapViewController.swift
//  2lesson15_3
//
//  Created by 徐國堂 on 2024/2/1.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showMapApp(_ sender:UIButton){
        print("Show Map App")
    }

}
