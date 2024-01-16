//
//  MyProgressView.swift
//  2lesson10_1
//
//  Created by 徐國堂 on 2024/1/16.
//

import UIKit

class MyProgressView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        UIColor.red.set()
        let ins:CGFloat = 2
        let r = self.bounds.insetBy(dx: ins, dy: ins)
        let radius = r.size.height / 2
        let midbottom = CGPoint(x: r.midX, y: r.maxY)
        let path = CGMutablePath()
        path.move(to: midbottom)
        path.addArc(tangent1End: CGPoint(x: r.maxX, y: r.maxY),
                    tangent2End: CGPoint(x: r.maxX, y: r.minY),
                    radius: radius)
        path.addArc(tangent1End: CGPoint(x: r.maxX, y: r.minY),
                    tangent2End: CGPoint(x: r.minX, y: r.minY),
                    radius: radius)
        path.addArc(tangent1End: CGPoint(x: r.minX, y: r.minY),
                    tangent2End: CGPoint(x: r.minX, y: r.maxY),
                    radius: radius)
        path.addArc(tangent1End: CGPoint(x: r.minX, y: r.maxY),
                    tangent2End: CGPoint(x: r.maxX, y: r.maxY),
                    radius: radius)
        path.closeSubpath()
        context?.addPath(path)
        context?.setLineWidth(2)
        context?.strokePath()
        context?.addPath(path)
        context?.clip()
        context?.fill(CGRect.init(x: r.origin.x, y: r.origin.y, width: r.width, height: r.height))
    }
   
}
