# 使用MapView

```swift
//
//  MapViewController.swift
//  Map
//
//  Created by Robert on 2019/2/9.
//  Copyright © 2019 Robert. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    @IBOutlet var mapView:MKMapView!
    var city:City?;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "地圖:\(city?.city ?? "")";
        self.mapView.delegate = self;
        let geoCoder = CLGeocoder();
        geoCoder.geocodeAddressString(city?.city ?? "台北") { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil,let placemarks = placemarks  {
                let annotation = MKPointAnnotation();
                annotation.title = self.city!.city;
                annotation.subtitle = self.city!.country;
                let placemark = placemarks[0];
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate;
                    self.mapView.showAnnotations([annotation], animated: true);
                    self.mapView.selectAnnotation(annotation, animated: true);
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000);
                    self.mapView.setRegion(region, animated: false);
                }
            }else{
                print("出錯了");
            }
        }
    }
    

}

extension MapViewController:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        let identifier = "Pin";
        if annotation.isKind(of: MKUserLocation.self){
            return nil;
        }
        
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView;
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true;
        }
        
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: city!.image);
        annotationView?.leftCalloutAccessoryView = leftIconView;
        return annotationView;
    }
}

```

