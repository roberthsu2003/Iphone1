//
//  MyAnnotationView.swift
//  2lesson15_3
//
//  Created by 徐國堂 on 2024/2/6.
//

import Foundation
import MapKit

class HotelAnnotationView:MKAnnotationView{
    override var annotation: MKAnnotation?{
        willSet{
            self.image = UIImage(systemName: "h.square.fill")
        }
    }
}
