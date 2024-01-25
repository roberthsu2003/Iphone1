//
//  MapViewController.swift
//  2lesson13_1
//
//  Created by 徐國堂 on 2024/1/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var city:City!
    lazy var map:MKMapView = {
        let mapView = MKMapView()
        //mapView.preferredConfiguration = MKMapConfiguration()
        let center = CLLocationCoordinate2DMake(city.lat, city.long)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.region = region
        //建立annotation
        let ann = MKPointAnnotation()
        ann.coordinate = center
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
        let mapView = self.view as! MKMapView
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
        
        //改變MapView
        mapView.delegate = self
        
    }
    


}

extension MapViewController:MKMapViewDelegate{
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView?{
        print("要產生AnnotationView")
        return nil
    }
}
