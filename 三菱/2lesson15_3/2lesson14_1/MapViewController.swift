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
    //停車場
    let parkLoc = CLLocationCoordinate2DMake(24.157603, 120.667282)
    //hotel
    let hotelLoc = CLLocationCoordinate2DMake(24.154901, 120.661713)
    //台中國立自然科學博物館
    let museumLoc = CLLocationCoordinate2DMake(24.15811, 120.66862)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mapView.tintColor = .green
        //let span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
        //MKCoordinateRegion(center: museumLoc, span:span )
        
        let reg = MKCoordinateRegion(center: museumLoc, latitudinalMeters: 1600, longitudinalMeters: 1600)
        self.mapView.region = reg
    }
    

    @IBAction func showMapApp(_ sender:UIButton){
        print("Show Map App")
    }

}
