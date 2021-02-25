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
                    print("緯度:\(location.coordinate.latitude)")
                    print("經度:\(location.coordinate.longitude)")
                    let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
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
