//
//  CircularProgressButton.swift
//  2lesson10_1
//
//  Created by 徐國堂 on 2024/1/16.
//

import UIKit

class CircularProgressButton: UIButton {
    var shapeLayer:CAShapeLayer!
    
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
        self.layer.addSublayer(layer)
        shapeLayer = layer
    }

}
