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
        print("執行")
        let layer = CAShapeLayer()
        shapeLayer = layer
    }

}
