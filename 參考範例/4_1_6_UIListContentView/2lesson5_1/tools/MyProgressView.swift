//
//  MyProgressView.swift
//  2lesson5_2
//
//  Created by 徐國堂 on 2024/1/7.
//

import UIKit
extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}
extension CGSize {
    init(_ width:CGFloat, _ height:CGFloat) {
        self.init(width:width, height:height)
    }
}
extension CGPoint {
    init(_ x:CGFloat, _ y:CGFloat) {
        self.init(x:x, y:y)
    }
}
extension CGVector {
    init (_ dx:CGFloat, _ dy:CGFloat) {
        self.init(dx:dx, dy:dy)
    }
}

class MyProgressView: UIView {

    var value : CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        let c = UIGraphicsGetCurrentContext()!
        UIColor.white.set()
        let ins : CGFloat = 2
        let r = self.bounds.insetBy(dx: ins, dy: ins)
        let radius : CGFloat = r.size.height / 2
        let midbottom = CGPoint(r.midX, r.maxY)
        let path = CGMutablePath()
        path.move(to: midbottom)
        path.addArc(tangent1End: CGPoint(r.maxX, r.maxY),
                    tangent2End: CGPoint(r.maxX, r.minY),
                    radius: radius)
        path.addArc(tangent1End: CGPoint(r.maxX, r.minY),
                    tangent2End: CGPoint(r.minX, r.minY),
                    radius: radius)
        path.addArc(tangent1End: CGPoint(r.minX, r.minY),
                    tangent2End: CGPoint(r.minX, r.maxY),
                    radius: radius)
        path.addArc(tangent1End: CGPoint(r.minX, r.maxY),
                    tangent2End: CGPoint(r.maxX, r.maxY),
                    radius: radius)
        path.closeSubpath()
        c.addPath(path)
        c.setLineWidth(2)
        c.strokePath()
        c.addPath(path)
        c.clip()
        c.fill(CGRect(r.origin.x, r.origin.y, r.width * self.value, r.height))
    }
}
