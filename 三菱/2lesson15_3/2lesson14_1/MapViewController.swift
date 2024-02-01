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
        
        let museumAnno = MKPointAnnotation()
        museumAnno.coordinate = museumLoc
        museumAnno.title = "台中國立自然科學博學館"
        museumAnno.subtitle = "可容納1000人"
        self.mapView.addAnnotation(museumAnno)
        
        let parkAnno = MKPointAnnotation()
        parkAnno.coordinate = parkLoc
        parkAnno.title = "第3停車場"
        parkAnno.subtitle = "可停200輛車"
        self.mapView.addAnnotation(parkAnno)
        
        let hotelAnno = HotelAnnotation(coordinate: hotelLoc, title: "住宿飯站", subtitle: "4星級飯站")
        self.mapView.addAnnotation(hotelAnno)
        
    }
    

    @IBAction func showMapApp(_ sender:UIButton){
        print("Show Map App")
    }

}
