//
//  MapViewController.swift
//  4_1_tableView
//
//  Created by 徐國堂 on 2024/1/18.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var city:City!
    lazy var map:MKMapView = {
        
        let col = CLLocationCoordinate2DMake(city.lat, city.long)
        //let span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
        //span使用公尺來計算
        //let reg = MKCoordinateRegion(center: col, span: span)
        let reg = MKCoordinateRegion(center: col, latitudinalMeters: 1200, longitudinalMeters: 1200)
        let mapView = MKMapView(frame: .zero)
        mapView.region = reg
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        //加入annotation()
        let ann = MKPointAnnotation()
        ann.coordinate = col
        ann.title = city.city
        ann.subtitle = city.country
        mapView.addAnnotation(ann)
        return mapView
    }()
    
    override func loadView() {
        super.loadView()
        self.view = map
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = city.city
        //改變UINavigationBar的背景色,使用scrollEdgeApperance
        let navigationBar = self.navigationController!.navigationBar
        navigationBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.darkGray]
        navBarAppearance.backgroundColor = UIColor.systemBackground
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        
        print(city!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

}
