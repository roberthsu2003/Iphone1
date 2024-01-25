
import UIKit
import MapKit

class HotelAnnotationView : MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            self.image = UIImage(systemName: "h.square.fill")
        }
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.bounds.size.height /= 1.0
        self.bounds.size.width /= 1.0
        self.centerOffset = CGPoint(x: 0,y: 0)
        self.canShowCallout = true
    }
}
