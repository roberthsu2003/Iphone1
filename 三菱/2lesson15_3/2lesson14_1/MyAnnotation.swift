//
//  MyAnnotation.swift
//  2lesson15_3
//
//  Created by 徐國堂 on 2024/2/1.
//

import Foundation
import MapKit

class HotelAnnotation:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title:String?
    var subtitle: String?
    
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
}
