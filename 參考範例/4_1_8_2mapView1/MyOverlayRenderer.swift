

import UIKit
import MapKit


class MyPathOverlayRenderer : MKOverlayRenderer {
    var angle : CGFloat = 0
    
    init(overlay:MKOverlay, angle:CGFloat) {
        self.angle = angle
        super.init(overlay:overlay)
    }
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in con: CGContext) {
        // we are being bombarded with four simultaneous threads!
        // however, I'm just ignoring that, and the incoming mapRect
        
        // print isn't thread-safe
        // we are already clipping to the mapRect equivalent
        NSLog("draw this: %@", MKStringFromMapRect(mapRect))
        NSLog("converts to: %@", NSCoder.string(for: self.rect(for:mapRect)))
        NSLog("currently clipping to: %@", NSCoder.string(for: con.boundingBoxOfClipPath))

        con.setStrokeColor(UIColor.black.cgColor)
        con.setFillColor(UIColor.red.withAlphaComponent(0.2).cgColor)
        con.setLineWidth(1.2/zoomScale)
        
        let unit = CGFloat((self.overlay.boundingMapRect).width/4.0)
        
        let p = CGMutablePath()
        let start = CGPoint(x: 0, y: unit*1.5)
        let p1 = CGPoint(x: start.x+2*unit, y: start.y)
        let p2 = CGPoint(x: p1.x, y: p1.y-unit)
        let p3 = CGPoint(x: p2.x+unit*2, y: p2.y+unit*1.5)
        let p4 = CGPoint(x: p2.x, y: p2.y+unit*3)
        let p5 = CGPoint(x: p4.x, y: p4.y-unit)
        let p6 = CGPoint(x: p5.x-2*unit, y: p5.y)
        let points = [start, p1, p2, p3, p4, p5, p6]
        // rotate the arrow around its center
        let t1 = CGAffineTransform(translationX: unit*2, y: unit*2)
        let t2 = t1.rotated(by:self.angle)
        let t3 = t2.translatedBy(x: -unit*2, y: -unit*2)
        p.addLines(between: points, transform: t3)
        p.closeSubpath()
        
        con.addPath(p)
        con.drawPath(using: .fillStroke)
    }
}



