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
    
    let parkId = "park"
    let hotelId = "hotel"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mapView.tintColor = .green
        self.mapView.delegate = self
        //let span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
        //MKCoordinateRegion(center: museumLoc, span:span )
        
        mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: parkId)
        mapView.register(HotelAnnotationView.self, forAnnotationViewWithReuseIdentifier: hotelId)
        
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
        
        //加overLay
        let hotelLat = self.hotelLoc.latitude
        let metersPerPoint1 = MKMetersPerMapPointAtLatitude(hotelLat)
        let cir = MKCircle(center: self.hotelLoc, radius: 30/metersPerPoint1)
        cir.title = "hotel"
        self.mapView.addOverlay(cir)
        
    }
    

    @IBAction func showMapApp(_ sender:UIButton){
        print("Show Map App")
    }

}

extension MapViewController:MKMapViewDelegate{
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView?{
        
        if let t = annotation.title,t == "台中國立自然科學博學館"{
            let id = MKMapViewDefaultAnnotationViewReuseIdentifier
            if let v = mapView.dequeueReusableAnnotationView(withIdentifier: id, for: annotation) as? MKMarkerAnnotationView{
                v.markerTintColor = .green
                v.glyphText = "!"
                v.isSelected = true
                return v
            }
            
        }
        
        if let t = annotation.title, t == "第3停車場"{
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: parkId, for: annotation)
            annotationView.image = UIImage(systemName: "hand.raised.square.on.square.fill")
            annotationView.canShowCallout = true
            return annotationView
        }
        
        if let t = annotation.title, t == "住宿飯站"{
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: hotelId, for: annotation) as! HotelAnnotationView
            annotationView.canShowCallout = true
            let rightImage = UIImage(systemName: "heart.square.fill")
            let rightImageView = UIImageView(image: rightImage)
            annotationView.rightCalloutAccessoryView = rightImageView
            
            annotationView.leftCalloutAccessoryView = UIButton.init(type: .infoLight, primaryAction: UIAction.init(handler: { _ in
                print("這是Hotel!")
            }))
            let lab = UILabel()
            lab.text = "網紅飯店"
            lab.font = lab.font.withSize(10)
            annotationView.detailCalloutAccessoryView = lab
            
            return annotationView
        }
        
        return nil
    }
    
    func mapView(
        _ mapView: MKMapView,
        rendererFor overlay: MKOverlay
    ) -> MKOverlayRenderer{
        if overlay.title == "hotel"{
            let r = MKCircleRenderer(circle: overlay as! MKCircle)
            r.fillColor = UIColor.red.withAlphaComponent(0.1)
            r.strokeColor = UIColor.red.withAlphaComponent(0.8)
            r.lineWidth = 2
            return r
        }else{
            return MKOverlayRenderer()
        }
    }
}
