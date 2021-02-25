//
//  MapViewController.swift
//  lesson21-1
//
//  Created by 徐國堂 on 2021/2/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var city:City!
    @IBOutlet var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "地圖:\(city.city!)"
        let geoCoder = CLGeocoder();
        geoCoder.geocodeAddressString(city!.city ?? "台北") { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil,let placemarks = placemarks{
                let placemark = placemarks[0]
                if let location = placemark.location{
                    let annotation = MKPointAnnotation();
                    annotation.title = self.city.city
                    annotation.subtitle = self.city.country
                    annotation.coordinate = location.coordinate
                    print("緯度:\(location.coordinate.latitude)")
                    print("經度:\(location.coordinate.longitude)")
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                    self.mapView.setRegion(region, animated: true)
                }
            }
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
