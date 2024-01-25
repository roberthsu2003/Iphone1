import UIKit
import MapKit

class HotelAnnotation : NSObject, MKAnnotation {
    dynamic var coordinate : CLLocationCoordinate2D //有dynamic才可以做動畫
    /* dynamic */ var title: String?
    var subtitle: String?
    
    init(location coord:CLLocationCoordinate2D) {
        self.coordinate = coord
        super.init()
    }

}
