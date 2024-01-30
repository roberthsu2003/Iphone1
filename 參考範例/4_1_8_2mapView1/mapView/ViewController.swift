//
//  ViewController.swift
//  mapView
//
//  Created by 徐國堂 on 2024/1/23.
//

import UIKit
import MapKit
func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

class ViewController: UIViewController {
    @IBOutlet var map:MKMapView!
    ///第3停車場
    let parkLoc = CLLocationCoordinate2DMake(24.157603, 120.667282)
    //hotel
    let hotelLoc = CLLocationCoordinate2DMake(24.154901, 120.661713)
    
    //台中國立自然科學博物館
    let museumLoc = CLLocationCoordinate2DMake(24.15811, 120.66862)
  
    
    let parkId = "park"
    let hotelId = "hotel"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: self.parkId)
        
        self.map.register(HotelAnnotationView.self, forAnnotationViewWithReuseIdentifier: self.hotelId)
        
        self.map.delegate = self
        self.map.tintColor = .green
        //台中國立自然科學博物館
        let loc = museumLoc
        //let span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
        //let reg = MKCoordinateRegion(center: loc, span: span)
        // or...
        let reg = MKCoordinateRegion(center: loc, latitudinalMeters: 1600, longitudinalMeters: 1600)
        self.map.region = reg
        
        // new in iOS 13 we can at last limit scroll and zoom!
        self.map.showsCompass = false //使用自訂compass,可以使用constraints
        let compass = MKCompassButton(mapView: self.map)
        compass.frame.origin = CGPoint(x: 20, y: 600)
        compass.compassVisibility = .visible
        self.view.addSubview(compass)
       
        let museumAnno = MKPointAnnotation()
        museumAnno.coordinate = museumLoc
        museumAnno.title = "台中國立自然科學博物館"
        museumAnno.subtitle = "可容納1000人"
        self.map.addAnnotation(museumAnno)
        
        let parkAnno = MKPointAnnotation()
        parkAnno.coordinate = parkLoc
        parkAnno.title = "第3停車場"
        parkAnno.subtitle = "可以停200輛車"
        self.map.addAnnotation(parkAnno)
        
        let hotelAnno = HotelAnnotation(location: hotelLoc)
        hotelAnno.title = "住宿飯店"
        hotelAnno.subtitle = "4星級飯店"
        self.map.addAnnotation(hotelAnno)
        
        //
        let lat = self.parkLoc.latitude
        let metersPerPoint = MKMetersPerMapPointAtLatitude(lat)
        var c = MKMapPoint(self.parkLoc)
        c.x += 150/metersPerPoint
        c.y -= 50/metersPerPoint
        var p1 = MKMapPoint(x: c.x, y: c.y)
        p1.y -= 100/metersPerPoint
        var p2 = MKMapPoint(x: c.x, y: c.y)
        p2.x += 100/metersPerPoint
        var p3 = MKMapPoint(x: c.x, y: c.y)
        p3.x += 300/metersPerPoint
        p3.y -= 400/metersPerPoint
        var points = [p1, p2, p3]
        let tri = MKPolygon(points:&points, count:3)
        self.map.addOverlay(tri)
}
    
}


extension ViewController:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
       
        let id = MKMapViewDefaultAnnotationViewReuseIdentifier
        if let v = mapView.dequeueReusableAnnotationView(withIdentifier: id, for: annotation) as? MKMarkerAnnotationView {
            if let t = annotation.title, t == "台中國立自然科學博物館" {
                v.titleVisibility = .visible
                v.subtitleVisibility = .visible
                v.markerTintColor = .green
                v.glyphText = "!"
                // v.glyphImage = UIImage(named:"smileyWithTransparencyTiny")!.withRenderingMode(.alwaysOriginal)
                //v.glyphImage = UIImage(systemName:"exclamationmark.circle")!
                v.glyphTintColor = .white
                v.animatesWhenAdded = true
                v.isSelected = true
                //v.isDraggable = true
                //print("tried to make it draggable")
                return v
            }
        }
        
        if let t = annotation.title, t == "第3停車場"{
            return nil;
        }
        
        if annotation is HotelAnnotation{
            let v = mapView.dequeueReusableAnnotationView(withIdentifier: hotelId, for: annotation)
            let im = UIImage(named: "smileyWithTransparencyTiny.png")!.withRenderingMode(.alwaysTemplate)
            let iv = UIImageView(image: im)
            v.leftCalloutAccessoryView = iv
            v.rightCalloutAccessoryView = UIButton.init(type: .infoLight, primaryAction: UIAction.init(handler: { _ in
                print("Hello! World!")
            }))
            
            let lab = UILabel()
            lab.text = "網紅飯店"
            lab.numberOfLines = 0
            lab.font = lab.font.withSize(10)
            v.detailCalloutAccessoryView = lab
            return v
            
        }
        
        return nil

    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("tap \(control)")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer{
        
        let r = MKPolygonRenderer(polygon:overlay as! MKPolygon)
            r.fillColor = UIColor.red.withAlphaComponent(0.1)
            r.strokeColor = UIColor.red.withAlphaComponent(0.8)
            r.lineWidth = 2
        return r
        
    }
    
    @IBAction func showMapApp(_ sender:UIButton){
        let p = MKPlacemark(coordinate: hotelLoc,addressDictionary: nil)
        let hotelItem = MKMapItem(placemark: p)
        //let currentItem = MKMapItem.forCurrentLocation()
        hotelItem.name = "nice place"
        let coord = self.museumLoc
        let span = self.map.region.span
        let opts:[String:Any] = [
            MKLaunchOptionsCameraKey:MKMapType.standard.rawValue,
            MKLaunchOptionsMapCenterKey:coord,
            MKLaunchOptionsMapSpanKey:span
        ]
        
        let scene = self.view.window?.windowScene
        hotelItem.openInMaps(launchOptions: opts, from: scene) { ok in
            print(ok)
        }
    }
    
}
