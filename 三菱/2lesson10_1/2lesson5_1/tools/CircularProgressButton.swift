//
//  CircularProgressButton.swift
//  2lesson10_1
//
//  Created by 徐國堂 on 2024/1/16.
//

import UIKit

class CircularProgressButton: UIButton {
    var shapeLayer:CAShapeLayer!
    var progress:Float = 0{
        didSet{
            self.shapeLayer.strokeEnd = CGFloat(progress)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard self.shapeLayer == nil else {return}
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        layer.lineWidth = 3
        layer.lineCap = .round
        layer.fillColor = nil
        layer.strokeColor = UIColor.red.cgColor
        let b = UIBezierPath(ovalIn: self.bounds.insetBy(dx: 3, dy: 3))
        layer.path = b.cgPath
        layer.strokeStart = 0
        layer.strokeEnd = 0
        layer.setAffineTransform(CGAffineTransform.init(rotationAngle: -.pi/2.0))
        self.layer.addSublayer(layer)
        shapeLayer = layer
    }

}
