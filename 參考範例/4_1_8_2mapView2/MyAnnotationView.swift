
import UIKit
import MapKit

class MyBikeAnnotationView : MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            self.image = UIImage(named:"clipartdirtbike.gif")
        }
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.bounds.size.height /= 3.0
        self.bounds.size.width /= 3.0
        self.centerOffset = CGPoint(x: 0,y: -20)
        self.canShowCallout = true
    }
}
